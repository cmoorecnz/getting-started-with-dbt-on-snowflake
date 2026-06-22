-- SCD2 snapshot for the ORDER_DETAIL source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_ORDER_DETAIL %}

{{
    config(
        target_schema='snapshots',
        unique_key='ORDER_DETAIL_ID',
        strategy='check',
        check_cols='all',
        transient=false
    )
}}

SELECT * FROM {{ source('tb_101', 'ORDER_DETAIL') }}

{% endsnapshot %}
