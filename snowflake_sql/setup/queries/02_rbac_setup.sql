---------------------------------------------------------
-- 1. CREATE ROLES
---------------------------------------------------------

create role if not exists DE_ROLE;
create role if not exists ANALYST_ROLE;

---------------------------------------------------------
-- 2. WAREHOUSE PERMISSIONS
---------------------------------------------------------

grant usage,operate on warehouse DE_WH to role DE_ROLE;
grant usage on warehouse DE_WH to role ANALYST_ROLE;

---------------------------------------------------------
-- 3. DATABASE ACCESS
---------------------------------------------------------
grant usage on database ECOMMERCE_DW to role DE_ROLE;
grant usage on database ECOMMERCE_DW to role ANALYST_ROLE;

---------------------------------------------------------
-- 4. SCHEMA ACCESS
---------------------------------------------------------
-- Full engineering access

grant all privileges on schema ECOMMERCE_DW.RAW to role DE_ROLE;
grant all privileges on schema ECOMMERCE_DW.STAGING to role DE_ROLE;
grant all privileges on schema ECOMMERCE_DW.MARTS to role DE_ROLE;
grant all privileges on schema ECOMMERCE_DW.SNAPSHOTS to role DE_ROLE;

-- Analyst read-only schema access
grant usage on schema ECOMMERCE_DW.MARTS to role ANALYST_ROLE;