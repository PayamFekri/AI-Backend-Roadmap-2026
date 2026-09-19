from sqlalchemy import create_engine
from sqlalchemy.orm import (
    sessionmaker,
    declarative_base
)
SQL_DATABASE_URL = "postgresql+psycopg2://postgres:admin@localhost:5432/test_SQLAlchemy" 

engine = create_engine(
    SQL_DATABASE_URL
)
session_local =sessionmaker(autocommit = False ,
                            autoflush= False ,
                            bind = engine)
Base = declarative_base()

Base.metadata.create_all(engine)
