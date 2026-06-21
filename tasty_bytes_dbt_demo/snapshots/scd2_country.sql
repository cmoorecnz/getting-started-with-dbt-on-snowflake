-- SCD2 snapshot for the COUNTRY source table tracking changes over time
-- Co-authored with CoCo
{% snapshot HIST_COUNTRY %}

{{
    config(
        target_schema='snapshots',
        unique_key='COUNTRY_ID',
        strategy='check',
        check_cols='all'
    )
}}

SELECT * FROM {{ source('tb_101', 'COUNTRY') }}

{% endsnapshot %}
