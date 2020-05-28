+++
title = "Arbitrarily-Structured Data in Relational Databases"
date = "2010-10-20 16:01:53 -0700"
+++

# Arbitrarily-Structured Data in Relational Databases

This approach is similar to [FriendFeed's schemaless database framework](http://bret.appspot.com/entry/how-friendfeed-uses-mysql). The key difference is in the data locality.

The goal is *not* to build an effective schemaless database on top of a relational database, but rather to accomodate for rapidly-evolving relational schemas and reducing the difficult of migrating forward.

## Hypothesis

In an evolving relational (SQL) database schema, we store two types of data: Data we will be querying against and data we will be displaying. There is often a subset of display data which will not be used for querying in the foreseeable future, and this is the data whose structure changes most often.

## Solution

Store query data and display data separately such that display data is less strictly-structured and thus more easily evolved.

Imagine a standardized table structure where each table has the following columns: ``id``, ``time_created``, ``time_updated``, ``_data``, and additional "index columns".

The ``_data`` column contains a dictionary of arbitrary data serialized into JSON (or could be zlib-compressed Pickle if it were Python-specific). Index columns are columns which you query against.

### Example

A typical *user* table might have the following columns (using an SQLAlchemy declarative model):

```python
class User(Model):

    id = Column(types.Integer, primary_key=True)
    time_created = Column(types.DateTime, default=datetime.now, nullable=False)
    time_updated = Column(types.DateTime, onupdate=datetime.now)

    is_admin = Column(types.Boolean, default=False, nullable=False)

    email = Column(types.String(255), nullable=False, index=True, unique=True)
    display_name = Column(types.String(64))

    password_hash = Column(types.String(40), nullable=False)
    password_salt = Column(types.String(8), nullable=False)
```

In our example, this table will have two types of queries:

```sql
-- Load the user object from the current session (where we store the user_id)
SELECT * FROM user WHERE id = :user_id;

-- Check the given password against the email address, for login
SELECT password_hash, password_salt FROM user WHERE email = :user_email;
```

In the schemaless model, the table would look like this:

```python
class User(SchemalessModel):

    id = Column(types.Integer, primary_key=True)
    time_created = Column(types.DateTime, default=datetime.now, nullable=False)
    time_updated = Column(types.DateTime, onupdate=datetime.now)
    _data = Column(types.JSON)

    email = Column(types.String(255), nullable=False, index=True, unique=True)
```

Where the ``_data`` column would contain data like this:

```javascript
{
    "display_name": "Andrey Petrov",
    "is_admin": 1,
    "password_hash": "cSKSsy315E4EroxeDQrsxjTb6ijBxxbK",
    "password_salt": "vS5Otm",
}
```

And perhaps we would build a framework on top of SQLAlchemy which would let us access columns as ``user.display_name`` or ``user.email`` regardless whether it's an extracted indexed property or a buried _data element.


### Process: Adding an index

1.  Build a table with just a free-structure ``_data`` field.
2.  Determine queries, extract relevant properties into indexed columns:
    1. ALTER TABLE to add the column
    2. Run full-scan query to populate new column with data
    3. Add relevant index onto said column
    4. Deprecate property from ``_data`` (optional, we could just assume that proper columns always supercede ``_data`` attributes)


## Concerns

* Adding an index may affect database performance during the process, due to the data locality. With FriendFeed's approach, the indices are stored in their own tables which could even be sharded across databases, so this removes any performance concerns during schema transitions. On the other hand, FriendFeed's approach reduces data locality which increases the number of joins required to get desired data, and also reduces the semantic meaning of the tables thus making queries more complex.
* Performing unexpected demographic analysis on large datasets would be much slower if the fields are stored in ``_data`` (such as age, gender, etc) since it would require a full table scan instead of an in-database aggregate query.
* Parsing and storing the ``_data`` dictionary has some performance implications, too. cPickle is best for parsing performance, perhaps zlib-compressed cPickle is best for data size and parsing performance tradeoff, but no portability beyond Python. zlib-compressed JSON reduces data size and is portable across languages, but increases parsing time. Also, this could be done natively for [PostgreSQL using HSTORE](http://www.postgresql.org/docs/current/static/hstore.html) ([via __jek__](http://twitter.com/#!/__jek__/status/27975347844))
* Tracking mutability is important, potentially hard to do elegantly.
