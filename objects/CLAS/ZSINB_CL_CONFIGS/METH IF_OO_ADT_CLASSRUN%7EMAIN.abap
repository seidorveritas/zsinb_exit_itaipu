  METHOD if_oo_adt_classrun~main.
    CALL METHOD insert_lista_cfg.


       DATA: lt_tbl TYPE TABLE OF /sfci/t_cfg_glob.

    lt_tbl = VALUE #(


      (
          mandt   =   ''
          modulo = 'SFCI'
          cons_data_fim = 'X'
      )
      ).


    DELETE FROM /sfci/t_cfg_glob.


    INSERT /sfci/t_cfg_glob FROM TABLE @lt_tbl.



DATA: lt_tbl2 TYPE TABLE OF /sfci/t_cfg_tbl.

    lt_tbl2 = VALUE #(
        ( client = '' tabname =  '/SFCI/T_CFG_GLOB' descricao = 'Configurações gerais de produto' )
    ).


    MODIFY /sfci/t_cfg_tbl FROM TABLE @lt_tbl2.


      DATA(lo_scope_api) = cl_aps_bc_scope_change_api=>create_instance( ).

    lo_scope_api->scope(
    EXPORTING it_object_scope = VALUE #(
    pgmid = if_aps_bc_scope_change_api=>gc_tadir_pgmid-R3TR
    scope_state = if_aps_bc_scope_change_api=>gc_scope_state-ON

* Space template
   ( object = if_aps_bc_scope_change_api=>gc_tadir_object-UIST obj_name = '/SFCI/SP_APPS' )

* Page template
    ( object = if_aps_bc_scope_change_api=>gc_tadir_object-UIPG obj_name = '/SFCI/PG_APPS' )
    ( object = if_aps_bc_scope_change_api=>gc_tadir_object-UIPG obj_name = '/SFCI/PG_CONF' )

)

            iv_simulate = abap_false
            iv_force = abap_false
    IMPORTING et_object_result = DATA(lt_results)
            et_message = DATA(lt_messages) ).

  ENDMETHOD.