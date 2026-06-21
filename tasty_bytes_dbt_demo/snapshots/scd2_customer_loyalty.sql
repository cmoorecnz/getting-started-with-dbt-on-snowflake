-- SCD2 snapshot for the CUSTOMER_LOYALTY source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_CUSTOMER_LOYALTY %}

{{
    config(
        target_schema='snapshots',
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols='all'
    )
}}

SELECT * FROM {{ source('tb_101', 'CUSTOMER_LOYALTY') }}

{% endsnapshot %}
