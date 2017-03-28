# liquibase-showcase
liquibase tutorial and showcase

# lancio la creazione del DB
mvn clean liquibase:update -Pmysql

# versione 1.1
mvn clean liquibase:update -Pmysql

#ROLL BACK
mvn liquibase:rollback -Dliquibase.rollbackTag=1.0 -Pmysql
