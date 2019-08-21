step 1: brew install postgresql
step 2: pip install psycopg2
step 3: close/open a new jupyter notebook
step 4: copy below to your notebook and execute

#!/usr/bin/python
import psycopg2 
 
def connect(postgres_host,postgres_db,postgres_user,postgres_pw,table_name):
    """ Connect to the PostgreSQL database server """
    conn = None
    try: 
        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(host=postgres_host,database=postgres_db,user=postgres_user,password=postgres_pw)
      
        # create a cursor
        cur = conn.cursor()
        
       # execute a statement
        print('PostgreSQL: select * from ' + table_name + ' LIMIT 1')
        cur.execute('SELECT * from '+ table_name + ' LIMIT 1')
 
        # display the PostgreSQL result
        row_1 = cur.fetchone()
        print(row_1)
       
       # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
 
 
if __name__ == '__main__':
    postgres_user = 'dsbc_student'
    postgres_pw = '7*.8G9QH21'
    postgres_host = '142.93.121.174'
    postgres_port = '5432'
    postgres_db = 'lifeexpectancy'
    table_name = 'lifeexpectancy'
    connect(postgres_host,postgres_db,postgres_user,postgres_pw,table_name)
