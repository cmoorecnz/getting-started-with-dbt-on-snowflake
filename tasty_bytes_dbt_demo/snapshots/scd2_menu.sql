-- SCD2 snapshot for the MENU source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_MENU %}

{{
    config(
        target_schema='snapshots',
        unique_key='MENU_ITEM_ID',
        strategy='check',
        check_cols='all'
    )
}}

SELECT * FROM {{ source('tb_101', 'MENU') }}

{% endsnapshot %}
