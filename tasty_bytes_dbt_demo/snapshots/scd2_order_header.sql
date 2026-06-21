-- SCD2 snapshot for the ORDER_HEADER source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_ORDER_HEADER %}

{{
    config(
        target_schema='snapshots',
        unique_key='ORDER_ID',
        strategy='check',
        check_cols='all'
    )
}}

SELECT * FROM {{ source('tb_101', 'ORDER_HEADER') }}

{% endsnapshot %}
