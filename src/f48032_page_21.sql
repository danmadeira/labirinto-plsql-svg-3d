prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.3'
,p_default_workspace_id=>38134676337898140197
,p_default_application_id=>48032
,p_default_id_offset=>0
,p_default_owner=>'WKSP_DMETI'
);
end;
/
 
prompt APPLICATION 48032 - Oracle APEX Development
--
-- Application Export:
--   Application:     48032
--   Name:            Oracle APEX Development
--   Exported By:     DMADEIRA@GMAIL.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 21
--   Manifest End
--   Version:         26.1.3
--   Instance ID:     63113759365424
--

begin
null;
end;
/
prompt --application/pages/delete_00021
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>21);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_imp_page.create_page(
 p_id=>21
,p_name=>'pg_labirinto'
,p_alias=>'LABIRINTO'
,p_step_title=>'Labirinto'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.labirinto {',
'  position: relative;',
'  min-height: 150px;',
'  margin: 0 auto;',
'  float: none !important;',
'}',
'',
'.t-Region-buttons-left {',
'  position: absolute;',
'  bottom: 15px;',
'  left: 50%;',
'  transform: translateX(-50%);',
'  display: flex;',
'  gap: 15px; ',
'  z-index: 10;',
'}',
'',
'.bt-dir {',
'  width: 40px;',
'  height: 40px;',
'  background-color: rgba(55, 76, 139, 0.81);',
'  color: #FFF;',
'  border-radius: 50px;',
'  display: flex;',
'  justify-content: center;',
'  align-items: center;',
'  cursor: pointer;',
'  margin-top: 22px;',
'}',
''))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(38137761775886382934)
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45396417779939337097)
,p_plug_name=>'Labirinto'
,p_static_id=>'labirinto'
,p_region_css_classes=>'labirinto'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_width  PLS_INTEGER;',
'  l_height PLS_INTEGER;',
'  l_scale  NUMBER;',
'  ',
'BEGIN',
'  l_width := NVL(TO_NUMBER(:P21_LARGURA), 1800);',
'  l_height := NVL(TO_NUMBER(:P21_ALTURA), ROUND(l_width * 2 / 3));',
'',
'  IF l_width <= 0 OR l_height <= 0 THEN',
unistr('    RAISE_APPLICATION_ERROR(-20001, ''As dimens\00F5es do SVG devem ser maiores que zero.'');'),
'  END IF;',
'',
'  IF NVL(:P21_CONCLUIDO, ''N'') = ''S'' THEN',
'    l_scale := LEAST(l_width / 1800, l_height / 1200);',
'',
'    RETURN ''<svg xmlns="http://www.w3.org/2000/svg" width="'' ||',
'      TO_CHAR(l_width, ''TM9'', ''NLS_NUMERIC_CHARACTERS=''''.,'''''') ||',
'      ''" height="'' ||',
'      TO_CHAR(l_height, ''TM9'', ''NLS_NUMERIC_CHARACTERS=''''.,'''''') ||',
'      ''" viewBox="0 0 '' ||',
'      TO_CHAR(l_width, ''TM9'', ''NLS_NUMERIC_CHARACTERS=''''.,'''''') || '' '' ||',
'      TO_CHAR(l_height, ''TM9'', ''NLS_NUMERIC_CHARACTERS=''''.,'''''') ||',
'      ''" preserveAspectRatio="xMidYMid meet">'' ||',
'      ''<rect width="100%" height="100%" fill="khaki"/>'' ||',
'      ''<text x="50%" y="50%" text-anchor="middle" dominant-baseline="middle" font-size="'' ||',
'      TO_CHAR(64 * l_scale, ''TM9'', ''NLS_NUMERIC_CHARACTERS=''''.,'''''') ||',
unistr('      ''">Labirinto conclu\00EDdo!</text></svg>'';'),
'  END IF;',
'',
'  RETURN ''<div style="display:flex;justify-content:center;width:100%;">'' ||',
'    pkg_labirinto.gerar_conteudo_dinamico(',
'      p_width        => l_width,',
'      p_height       => l_height,',
'      p_linha        => :P21_LINHA,',
'      p_coluna       => :P21_COLUNA,',
'      p_direcao      => :P21_DIRECAO,',
'      p_labirinto_id => :P21_LABIRINTO',
'    ) ||',
'    ''</div>'';',
'END;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P21_LARGURA,P21_ALTURA,P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_CONCLUIDO,P21_LABIRINTO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41802376099494388309)
,p_plug_name=>'Mapa'
,p_static_id=>'mapa_1'
,p_parent_plug_id=>wwv_flow_imp.id(41802375941243388308)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  RETURN ''<div style="display:flex;justify-content:center;width:100%;">'' ||',
'          pkg_labirinto.gerar_miniatura (',
'            p_labirinto_id => :P21_LABIRINTO',
'          , p_linha        => :P21_LINHA',
'          , p_coluna       => :P21_COLUNA',
'          ) ||',
'         ''</div>'';',
'END;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P21_LABIRINTO,P21_LINHA,P21_COLUNA'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41802375941243388308)
,p_plug_name=>'Setup'
,p_static_id=>'setup'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(154772518550126563636)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(45396417779939337097)
,p_button_name=>'Direita'
,p_static_id=>'direita'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pillEnd'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Direita'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'bt-dir bt-dir-dir'
,p_icon_css_classes=>'fa-lg fa-arrow-right-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(154772518352480563634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45396417779939337097)
,p_button_name=>'Esquerda'
,p_static_id=>'esquerda'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pillStart'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Esquerda'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'bt-dir bt-dir-esq'
,p_icon_css_classes=>'fa-lg fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(154772518420080563635)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(45396417779939337097)
,p_button_name=>'Frente'
,p_static_id=>'frente'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2350584059425431644
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Frente'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'bt-dir bt-dir-fre'
,p_icon_css_classes=>'fa-lg fa-arrow-up-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41802375381307388303)
,p_name=>'P21_ALTURA'
,p_item_sequence=>50
,p_item_default=>'500'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154772518088701563631)
,p_name=>'P21_COLUNA'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154772519943975563650)
,p_name=>'P21_CONCLUIDO'
,p_item_sequence=>90
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154772518185022563632)
,p_name=>'P21_DIRECAO'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41802375422302388304)
,p_name=>'P21_LABIRINTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(41802375941243388308)
,p_item_default=>'1'
,p_prompt=>'Labirinto'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT to_char(labirinto_id) || ''. '' || descricao',
'     , labirinto_id',
'  FROM labirintos;'))
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154772517898672563629)
,p_name=>'P21_LARGURA'
,p_item_sequence=>40
,p_item_default=>'1000'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(154772517977110563630)
,p_name=>'P21_LINHA'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(154772519330245563644)
,p_name=>'Andar Frente'
,p_static_id=>'andar-frente'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(154772518420080563635)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154772519416494563645)
,p_event_id=>wwv_flow_imp.id(154772519330245563644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'alterar-linha'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_CONCLUIDO',
  'items_to_submit', 'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_LABIRINTO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  l_linha     PLS_INTEGER  := TO_NUMBER(:P21_LINHA);',
    '  l_coluna    PLS_INTEGER  := TO_NUMBER(:P21_COLUNA);',
    '  l_direcao   VARCHAR2(10) := :P21_DIRECAO;',
    '  l_concluido BOOLEAN;',
    '  l_labirinto PLS_INTEGER  := TO_NUMBER(:P21_LABIRINTO);',
    '',
    'BEGIN',
    '  pkg_labirinto.aplicar_comando(',
    '    p_comando      => ''F'',',
    '    p_linha        => l_linha,',
    '    p_coluna       => l_coluna,',
    '    p_direcao      => l_direcao,',
    '    p_concluido    => l_concluido,',
    '    p_labirinto_id => l_labirinto',
    '  );',
    '',
    '  :P21_LINHA     := TO_CHAR(l_linha);',
    '  :P21_COLUNA    := TO_CHAR(l_coluna);',
    '  :P21_DIRECAO   := l_direcao;',
    '  ',
    '  IF l_concluido THEN',
    '    :P21_CONCLUIDO := ''S'';',
    '  ELSE',
    '    :P21_CONCLUIDO := ''N'';',
    '  END IF;',
    '  ',
    'END;')),
  'show_processing', 'N',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41802376378501388312)
,p_event_id=>wwv_flow_imp.id(154772519330245563644)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41802376099494388309)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154772519754555563648)
,p_event_id=>wwv_flow_imp.id(154772519330245563644)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45396417779939337097)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41802375615037388305)
,p_name=>'Iniciar Labirinto'
,p_static_id=>'iniciar-labirinto'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_LABIRINTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41802375717470388306)
,p_event_id=>wwv_flow_imp.id(41802375615037388305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_CONCLUIDO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41802375894786388307)
,p_event_id=>wwv_flow_imp.id(41802375615037388305)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45396417779939337097)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41802376105944388310)
,p_event_id=>wwv_flow_imp.id(41802375615037388305)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh_1'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41802376099494388309)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(154772519182632563642)
,p_name=>'Virar Direita'
,p_static_id=>'virar-direita'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(154772518550126563636)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41802376448026388313)
,p_event_id=>wwv_flow_imp.id(154772519182632563642)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41802376099494388309)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154772519289573563643)
,p_event_id=>wwv_flow_imp.id(154772519182632563642)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_CONCLUIDO',
  'items_to_submit', 'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_LABIRINTO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  l_linha     PLS_INTEGER  := TO_NUMBER(:P21_LINHA);',
    '  l_coluna    PLS_INTEGER  := TO_NUMBER(:P21_COLUNA);',
    '  l_direcao   VARCHAR2(10) := :P21_DIRECAO;',
    '  l_concluido BOOLEAN;',
    '  l_labirinto PLS_INTEGER  := TO_NUMBER(:P21_LABIRINTO);',
    '',
    'BEGIN',
    '  pkg_labirinto.aplicar_comando(',
    '    p_comando      => ''R'',',
    '    p_linha        => l_linha,',
    '    p_coluna       => l_coluna,',
    '    p_direcao      => l_direcao,',
    '    p_concluido    => l_concluido,',
    '    p_labirinto_id => l_labirinto',
    '  );',
    '',
    '  :P21_LINHA     := TO_CHAR(l_linha);',
    '  :P21_COLUNA    := TO_CHAR(l_coluna);',
    '  :P21_DIRECAO   := l_direcao;',
    '  ',
    '  IF l_concluido THEN',
    '    :P21_CONCLUIDO := ''S'';',
    '  ELSE',
    '    :P21_CONCLUIDO := ''N'';',
    '  END IF;',
    '  ',
    'END;')),
  'show_processing', 'N',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154772519894015563649)
,p_event_id=>wwv_flow_imp.id(154772519182632563642)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45396417779939337097)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(154772518870300563639)
,p_name=>'Virar Esquerda'
,p_static_id=>'virar-esquerda'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(154772518352480563634)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41802376248412388311)
,p_event_id=>wwv_flow_imp.id(154772518870300563639)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41802376099494388309)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154772518991003563640)
,p_event_id=>wwv_flow_imp.id(154772518870300563639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_CONCLUIDO',
  'items_to_submit', 'P21_LINHA,P21_COLUNA,P21_DIRECAO,P21_LABIRINTO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  l_linha     PLS_INTEGER  := TO_NUMBER(:P21_LINHA);',
    '  l_coluna    PLS_INTEGER  := TO_NUMBER(:P21_COLUNA);',
    '  l_direcao   VARCHAR2(10) := :P21_DIRECAO;',
    '  l_concluido BOOLEAN;',
    '  l_labirinto PLS_INTEGER  := TO_NUMBER(:P21_LABIRINTO);',
    '',
    'BEGIN',
    '  pkg_labirinto.aplicar_comando(',
    '    p_comando      => ''L'',',
    '    p_linha        => l_linha,',
    '    p_coluna       => l_coluna,',
    '    p_direcao      => l_direcao,',
    '    p_concluido    => l_concluido,',
    '    p_labirinto_id => l_labirinto',
    '  );',
    '',
    '  :P21_LINHA     := TO_CHAR(l_linha);',
    '  :P21_COLUNA    := TO_CHAR(l_coluna);',
    '  :P21_DIRECAO   := l_direcao;',
    '  ',
    '  IF l_concluido THEN',
    '    :P21_CONCLUIDO := ''S'';',
    '  ELSE',
    '    :P21_CONCLUIDO := ''N'';',
    '  END IF;',
    '  ',
    'END;')),
  'show_processing', 'N',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(154772519638224563647)
,p_event_id=>wwv_flow_imp.id(154772518870300563639)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45396417779939337097)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
