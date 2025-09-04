  METHOD insert_lista_cfg.


    DATA: lt_tbl TYPE TABLE OF /sinb/t_cfg.

    lt_tbl = VALUE #(
        ( client = '' tabname =  '/SINB/T_CFG_GLOB' descricao = 'Configurações gerais de produto' )
        ( client = '' tabname =  '/SINB/T_JOBGETLI' descricao = 'Controle de Job GET_LIST' )
        ( client = '' tabname =  '/SINB/T_MDE_EMP'  descricao =  'MDE Empresas' )
        ( client = '' tabname =  '/SINB/T_MDE_NSU'  descricao =  'MDE - Controle NSU' )
        ( client = '' tabname =  '/SINB/T_MDE_REAS' descricao = 'Motivo para não realização da operação' )
        ( client = '' tabname =  '/SINB/T_ORBITPDF' descricao = 'Config busca PDF Orbit' )
        ( client = '' tabname =  '/SINB/T_PARA_JOB' descricao = 'Parâmetros execução JOB' )
        ( client = '' tabname =  '/SINB/T_STSCODE'  descricao =  'Código Status SEFAZ' )
    ).


    MODIFY /sinb/t_cfg FROM TABLE @lt_tbl.
    COMMIT WORK.
  ENDMETHOD.