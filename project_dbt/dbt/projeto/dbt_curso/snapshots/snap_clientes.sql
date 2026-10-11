{% snapshot snap_clientes  %}

{{
    config(
        target_schema='snapshots',
        unique_key='id_cliente',
        strategy='check',
        check_cols=['nome_completo','cidade','estado']
    )
}}

SELECT * FROM {{ ref('stg_clientes')}}

{%  endsnapshot  %}