CREATE OR REPLACE PACKAGE scalable_vector_graphics
-- =================================================================================================
-- Author:      Daniel Madeira
-- Create date: 21/11/2021
-- Description: A package to build the SVG version 1.1 graphics based on the XML grammar.
--              Each function returns an SVG element, container element or graphic element,
--              including the respective attributes and properties.
-- Version:     1.0.1
-- License:     https://opensource.org/licenses/GPL-3.0 GNU General Public License version 3
-- =================================================================================================
AS
  FUNCTION xml10_declaration (
    p_standalone              IN VARCHAR2 DEFAULT 'no'
  , p_encoding                IN VARCHAR2 DEFAULT 'UTF-8'
  )
  RETURN VARCHAR2;
  
  FUNCTION document_type_declaration (
    p_doctype                 IN VARCHAR2
  )
  RETURN VARCHAR2;
  
  FUNCTION svg_element (
    p_content                 IN CLOB
  , p_width                   IN VARCHAR2 DEFAULT '1366px'
  , p_height                  IN VARCHAR2 DEFAULT '768px'
  , p_x                       IN VARCHAR2 DEFAULT NULL
  , p_y                       IN VARCHAR2 DEFAULT NULL
  , p_namespace               IN BOOLEAN  DEFAULT TRUE
  , p_version                 IN VARCHAR2 DEFAULT '1.1'
  , p_baseprofile             IN VARCHAR2 DEFAULT NULL
  , p_contentscripttype       IN VARCHAR2 DEFAULT NULL
  , p_contentstyletype        IN VARCHAR2 DEFAULT NULL
  , p_base                    IN VARCHAR2 DEFAULT NULL
  , p_lang                    IN VARCHAR2 DEFAULT NULL
  , p_space                   IN VARCHAR2 DEFAULT NULL
  , p_xlink                   IN BOOLEAN  DEFAULT FALSE
  , p_viewbox                 IN VARCHAR2 DEFAULT NULL
  , p_preserveaspectratio     IN VARCHAR2 DEFAULT NULL
  , p_zoomandpan              IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN CLOB;
  
  FUNCTION title_element (
    p_content                 IN VARCHAR2
  )
  RETURN VARCHAR2;
  
  FUNCTION desc_element (
    p_content                 IN VARCHAR2
  )
  RETURN VARCHAR2;
  
  FUNCTION defs_element (
    p_elements                IN VARCHAR2
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION a_element (
    p_elements                IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_xlink_href              IN VARCHAR2 DEFAULT NULL
  , p_xlink_show              IN VARCHAR2 DEFAULT NULL
  , p_xlink_actuate           IN VARCHAR2 DEFAULT NULL
  , p_target                  IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION script_element (
    p_content                 IN VARCHAR2 DEFAULT NULL
  , p_xlinkhref               IN VARCHAR2 DEFAULT NULL
  , p_content_type            IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION group_element (
    p_elements                IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION symbol_element (
    p_content                 IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_preserveaspectratio     IN VARCHAR2 DEFAULT NULL
  , p_viewbox                 IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION use_element (
    p_xlinkhref               IN VARCHAR2
  , p_x                       IN VARCHAR2 DEFAULT NULL
  , p_y                       IN VARCHAR2 DEFAULT NULL
  , p_width                   IN VARCHAR2 DEFAULT NULL
  , p_height                  IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION path_element (
    p_d                       IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_pathlength              IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION presentation_attribute (
    p_text_anchor             IN VARCHAR2 DEFAULT NULL
  , p_fill                    IN VARCHAR2 DEFAULT NULL
  , p_fill_rule               IN VARCHAR2 DEFAULT NULL
  , p_fill_opacity            IN VARCHAR2 DEFAULT NULL
  , p_stroke                  IN VARCHAR2 DEFAULT NULL
  , p_stroke_width            IN VARCHAR2 DEFAULT NULL
  , p_stroke_linecap          IN VARCHAR2 DEFAULT NULL
  , p_stroke_linejoin         IN VARCHAR2 DEFAULT NULL
  , p_stroke_miterlimit       IN VARCHAR2 DEFAULT NULL
  , p_stroke_dasharray        IN VARCHAR2 DEFAULT NULL
  , p_stroke_dashoffset       IN VARCHAR2 DEFAULT NULL
  , p_stroke_opacity          IN VARCHAR2 DEFAULT NULL
  , p_stop_opacity            IN VARCHAR2 DEFAULT NULL
  , p_opacity                 IN VARCHAR2 DEFAULT NULL
  , p_stop_color              IN VARCHAR2 DEFAULT NULL
  , p_color                   IN VARCHAR2 DEFAULT NULL
  , p_font_family             IN VARCHAR2 DEFAULT NULL
  , p_font_style              IN VARCHAR2 DEFAULT NULL
  , p_font_variant            IN VARCHAR2 DEFAULT NULL
  , p_font_weight             IN VARCHAR2 DEFAULT NULL
  , p_font_stretch            IN VARCHAR2 DEFAULT NULL
  , p_font_size               IN VARCHAR2 DEFAULT NULL
  , p_font_size_adjust        IN VARCHAR2 DEFAULT NULL
  , p_font                    IN VARCHAR2 DEFAULT NULL
  , p_kerning                 IN VARCHAR2 DEFAULT NULL
  , p_letter_spacing          IN VARCHAR2 DEFAULT NULL
  , p_word_spacing            IN VARCHAR2 DEFAULT NULL
  , p_text_decoration         IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION text_element (
    p_content                 IN VARCHAR2
  , p_x                       IN VARCHAR2 DEFAULT NULL
  , p_y                       IN VARCHAR2 DEFAULT NULL
  , p_dx                      IN VARCHAR2 DEFAULT NULL
  , p_dy                      IN VARCHAR2 DEFAULT NULL
  , p_rotate                  IN VARCHAR2 DEFAULT NULL
  , p_textlength              IN VARCHAR2 DEFAULT NULL
  , p_lengthadjust            IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION tspan_element (
    p_content                 IN VARCHAR2
  , p_x                       IN VARCHAR2 DEFAULT NULL
  , p_y                       IN VARCHAR2 DEFAULT NULL
  , p_dx                      IN VARCHAR2 DEFAULT NULL
  , p_dy                      IN VARCHAR2 DEFAULT NULL
  , p_rotate                  IN VARCHAR2 DEFAULT NULL
  , p_textlength              IN VARCHAR2 DEFAULT NULL
  , p_lengthadjust            IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION tref_element (
    p_xlinkhref               IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION textpath_element (
    p_content                 IN VARCHAR2
  , p_xlinkhref               IN VARCHAR2 DEFAULT NULL
  , p_startoffset             IN VARCHAR2 DEFAULT NULL
  , p_method                  IN VARCHAR2 DEFAULT NULL
  , p_spacing                 IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION font_element (
    p_content                 IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_horizoriginx            IN NUMBER   DEFAULT NULL
  , p_horizoriginy            IN NUMBER   DEFAULT NULL
  , p_horizadvx               IN NUMBER   DEFAULT NULL
  , p_vertoriginx             IN NUMBER   DEFAULT NULL
  , p_vertoriginy             IN NUMBER   DEFAULT NULL
  , p_vertadvy                IN NUMBER   DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION font_face_attribute (
    p_font_family             IN VARCHAR2 DEFAULT NULL
  , p_font_style              IN VARCHAR2 DEFAULT NULL
  , p_font_variant            IN VARCHAR2 DEFAULT NULL
  , p_font_weight             IN VARCHAR2 DEFAULT NULL
  , p_font_stretch            IN VARCHAR2 DEFAULT NULL
  , p_font_size               IN VARCHAR2 DEFAULT NULL
  , p_unicode_range           IN VARCHAR2 DEFAULT NULL
  , p_units_per_em            IN VARCHAR2 DEFAULT NULL
  , p_panose_1                IN VARCHAR2 DEFAULT NULL
  , p_stemv                   IN VARCHAR2 DEFAULT NULL
  , p_stemh                   IN VARCHAR2 DEFAULT NULL
  , p_slope                   IN VARCHAR2 DEFAULT NULL
  , p_cap_height              IN VARCHAR2 DEFAULT NULL
  , p_x_height                IN VARCHAR2 DEFAULT NULL
  , p_accent_height           IN VARCHAR2 DEFAULT NULL
  , p_ascent                  IN VARCHAR2 DEFAULT NULL
  , p_descent                 IN VARCHAR2 DEFAULT NULL
  , p_widths                  IN VARCHAR2 DEFAULT NULL
  , p_bbox                    IN VARCHAR2 DEFAULT NULL
  , p_ideographic             IN VARCHAR2 DEFAULT NULL
  , p_alphabetic              IN VARCHAR2 DEFAULT NULL
  , p_mathematical            IN VARCHAR2 DEFAULT NULL
  , p_hanging                 IN VARCHAR2 DEFAULT NULL
  , p_v_ideographic           IN VARCHAR2 DEFAULT NULL
  , p_v_alphabetic            IN VARCHAR2 DEFAULT NULL
  , p_v_mathematical          IN VARCHAR2 DEFAULT NULL
  , p_v_hanging               IN VARCHAR2 DEFAULT NULL
  , p_underline_position      IN VARCHAR2 DEFAULT NULL
  , p_underline_thickness     IN VARCHAR2 DEFAULT NULL
  , p_strikethrough_position  IN VARCHAR2 DEFAULT NULL
  , p_strikethrough_thickness IN VARCHAR2 DEFAULT NULL
  , p_overline_position       IN VARCHAR2 DEFAULT NULL
  , p_overline_thickness      IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION font_face_uri_element (
    p_xlinkhref               IN VARCHAR2
  )
  RETURN VARCHAR2;
  
  FUNCTION font_face_name_element (
    p_name                    IN VARCHAR2
  )
  RETURN VARCHAR2;
  
  FUNCTION font_face_src_element (
    p_id                      IN VARCHAR2
  , p_fonte_face_uri          IN VARCHAR2 DEFAULT NULL
  , p_fonte_face_name         IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION font_face_element (
    p_font_face_src           IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION glyph_element (
    p_content                 IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_unicode                 IN VARCHAR2 DEFAULT NULL
  , p_glyphname               IN VARCHAR2 DEFAULT NULL
  , p_d                       IN VARCHAR2 DEFAULT NULL
  , p_orientation             IN VARCHAR2 DEFAULT NULL
  , p_arabicform              IN VARCHAR2 DEFAULT NULL
  , p_lang                    IN VARCHAR2 DEFAULT NULL
  , p_horizadvx               IN VARCHAR2 DEFAULT NULL
  , p_vertoriginx             IN VARCHAR2 DEFAULT NULL
  , p_vertoriginy             IN VARCHAR2 DEFAULT NULL
  , p_vertadvy                IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION rect_element (
    p_x                       IN VARCHAR2 DEFAULT NULL
  , p_y                       IN VARCHAR2 DEFAULT NULL
  , p_width                   IN VARCHAR2 DEFAULT NULL
  , p_height                  IN VARCHAR2 DEFAULT NULL
  , p_rx                      IN VARCHAR2 DEFAULT NULL
  , p_ry                      IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION circle_element (
    p_cx                      IN VARCHAR2 DEFAULT NULL
  , p_cy                      IN VARCHAR2 DEFAULT NULL
  , p_r                       IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION ellipse_element (
    p_cx                      IN VARCHAR2 DEFAULT NULL
  , p_cy                      IN VARCHAR2 DEFAULT NULL
  , p_rx                      IN VARCHAR2 DEFAULT NULL
  , p_ry                      IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION line_element (
    p_x1                      IN VARCHAR2 DEFAULT NULL
  , p_y1                      IN VARCHAR2 DEFAULT NULL
  , p_x2                      IN VARCHAR2 DEFAULT NULL
  , p_y2                      IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION polyline_element (
    p_points                  IN VARCHAR2
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION polygon_element (
    p_points                  IN VARCHAR2
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION image_element (
    p_xlinkhref               IN VARCHAR2
  , p_x                       IN VARCHAR2 DEFAULT NULL
  , p_y                       IN VARCHAR2 DEFAULT NULL
  , p_width                   IN VARCHAR2 DEFAULT NULL
  , p_height                  IN VARCHAR2 DEFAULT NULL
  , p_preserveaspectratio     IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  , p_transform               IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION lineargradient_element (
    p_stops                   IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_x1                      IN VARCHAR2 DEFAULT NULL
  , p_y1                      IN VARCHAR2 DEFAULT NULL
  , p_x2                      IN VARCHAR2 DEFAULT NULL
  , p_y2                      IN VARCHAR2 DEFAULT NULL
  , p_gradientunits           IN VARCHAR2 DEFAULT NULL
  , p_gradienttransform       IN VARCHAR2 DEFAULT NULL
  , p_spreadmethod            IN VARCHAR2 DEFAULT NULL
  , p_xlinkhref               IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
  FUNCTION stop_element (
    p_offset                  IN VARCHAR2
  , p_stop_color              IN VARCHAR2
  , p_stop_opacity            IN VARCHAR2
  )
  RETURN VARCHAR2;
  
  FUNCTION radialgradient_element (
    p_stops                   IN VARCHAR2
  , p_id                      IN VARCHAR2 DEFAULT NULL
  , p_cx                      IN VARCHAR2 DEFAULT NULL
  , p_cy                      IN VARCHAR2 DEFAULT NULL
  , p_r                       IN VARCHAR2 DEFAULT NULL
  , p_fx                      IN VARCHAR2 DEFAULT NULL
  , p_fy                      IN VARCHAR2 DEFAULT NULL
  , p_gradientunits           IN VARCHAR2 DEFAULT NULL
  , p_gradienttransform       IN VARCHAR2 DEFAULT NULL
  , p_spreadmethod            IN VARCHAR2 DEFAULT NULL
  , p_xlinkhref               IN VARCHAR2 DEFAULT NULL
  , p_presentation            IN VARCHAR2 DEFAULT NULL
  , p_class                   IN VARCHAR2 DEFAULT NULL
  , p_style                   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2;
  
END scalable_vector_graphics;
/

CREATE OR REPLACE PACKAGE BODY scalable_vector_graphics
AS
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The XML 1.0 declaration.
  --
  -- Parameters:
  --   @p_standalone = "no | yes"
  --   @p_encoding   = "UTF-8 | UTF-16 | ISO-8859-1 | ISO-2022-JP | Shift_JIS | EUC-JP"
  -- Returns:
  --   <?xml ?> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION xml10_declaration (
    p_standalone IN VARCHAR2 DEFAULT 'no'
  , p_encoding   IN VARCHAR2 DEFAULT 'UTF-8'
  )
  RETURN VARCHAR2
  IS
    l_standalone VARCHAR2(100);
    l_encoding   VARCHAR2(100);
    
  BEGIN
    IF p_standalone IS NOT NULL THEN
      l_standalone := ' standalone="' || p_standalone || '"';
    END IF;
    IF p_encoding IS NOT NULL THEN
      l_encoding := ' encoding="' || p_encoding || '"';
    END IF;
  
    RETURN '<?xml version="1.0"' || l_encoding || l_standalone || '?>' || chr(13) || chr(10);
  END xml10_declaration;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The SVG or HTML document type declaration.
  --
  -- Parameters:
  --   @l_dtd = "S | H" (SVG or HTML)
  -- Returns:
  --   <!DOCTYPE> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION document_type_declaration (p_doctype IN VARCHAR2)
  RETURN VARCHAR2
  IS
    l_dtd VARCHAR2(100);
    
  BEGIN
    IF (upper (p_doctype) = 'S') THEN
      l_dtd := '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">';
    ELSIF (upper (p_doctype) = 'H') THEN
      l_dtd := '<!DOCTYPE html>';
    END IF;
    
    RETURN l_dtd || chr(13) || chr(10);
    
  END document_type_declaration;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The SVG document fragment.
  --
  -- Parameters:
  --   @p_width               = "<length> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_height              = "<length> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_x                   = "<coordinate> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_y                   = "<coordinate> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_namespace           = True or false
  --   @p_version             = "<number>"
  --   @p_baseprofile         = profile-name
  --   @p_contentscripttype   = "content-type"
  --   @p_contentstyletype    = "content-type"
  --   @p_base                = "<iri>"
  --   @p_lang                = "languageID"
  --   @p_space               = "{default | preserve}"
  --   @p_xlink               = True or false
  --   @p_viewbox             = "<min-x> <min-y> <width> <height>"
  --   @p_preserveaspectratio = "none | xMinYMin | xMidYMin | xMaxYMin
  --                                  | xMinYMid | xMidYMid | xMaxYMid
  --                                  | xMinYMax | xMidYMax | xMaxYMax
  --                             meet | slice"
  --   @p_zoomandpan          = "disable | magnify"
  --   @p_presentation        = The presentation attributes
  --   @p_id                  = The unique name to an element
  --   @p_class               = A class name or set of class names to an element
  --   @p_style               = The style information for the current element
  -- Returns:
  --   <svg> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION svg_element (
    p_content             IN CLOB
  , p_width               IN VARCHAR2 DEFAULT '1366px'
  , p_height              IN VARCHAR2 DEFAULT '768px'
  , p_x                   IN VARCHAR2 DEFAULT NULL
  , p_y                   IN VARCHAR2 DEFAULT NULL
  , p_namespace           IN BOOLEAN  DEFAULT TRUE
  , p_version             IN VARCHAR2 DEFAULT '1.1'
  , p_baseprofile         IN VARCHAR2 DEFAULT NULL
  , p_contentscripttype   IN VARCHAR2 DEFAULT NULL
  , p_contentstyletype    IN VARCHAR2 DEFAULT NULL
  , p_base                IN VARCHAR2 DEFAULT NULL
  , p_lang                IN VARCHAR2 DEFAULT NULL
  , p_space               IN VARCHAR2 DEFAULT NULL
  , p_xlink               IN BOOLEAN  DEFAULT FALSE
  , p_viewbox             IN VARCHAR2 DEFAULT NULL
  , p_preserveaspectratio IN VARCHAR2 DEFAULT NULL
  , p_zoomandpan          IN VARCHAR2 DEFAULT NULL
  , p_presentation        IN VARCHAR2 DEFAULT NULL
  , p_id                  IN VARCHAR2 DEFAULT NULL
  , p_class               IN VARCHAR2 DEFAULT NULL
  , p_style               IN VARCHAR2 DEFAULT NULL
  )
  RETURN CLOB
  IS
    l_x                   VARCHAR2(100);
    l_y                   VARCHAR2(100);
    l_ns                  VARCHAR2(100);
    l_version             VARCHAR2(100);
    l_baseprofile         VARCHAR2(100);
    l_contentscripttype   VARCHAR2(100);
    l_contentstyletype    VARCHAR2(100);
    l_base                VARCHAR2(100);
    l_lang                VARCHAR2(100);
    l_space               VARCHAR2(100);
    l_link                VARCHAR2(100);
    l_viewbox             VARCHAR2(100);
    l_preserveaspectratio VARCHAR2(100);
    l_zoomandpan          VARCHAR2(100);
    l_id                  VARCHAR2(100);
    l_class               VARCHAR2(100);
    l_style               VARCHAR2(100);
    
  BEGIN
    IF p_x IS NOT NULL THEN
      l_x := ' x="' || p_x || '"';
    END IF;
    IF p_y IS NOT NULL THEN
      l_y := ' y="' || p_y || '"';
    END IF;
    IF p_namespace THEN
      l_ns := ' xmlns="http://www.w3.org/2000/svg"';
    END IF;
    IF p_version IS NOT NULL THEN
      l_version := ' version="' || p_version || '"';
    END IF;
    IF p_baseprofile IS NOT NULL THEN
      l_baseprofile := ' baseProfile="' || p_baseprofile || '"';
    END IF;
    IF p_contentscripttype IS NOT NULL THEN
      l_contentscripttype := ' contentScriptType="' || p_contentscripttype || '"';
    END IF;
    IF p_contentstyletype IS NOT NULL THEN
      l_contentstyletype := ' contentStyleType="' || p_contentstyletype || '"';
    END IF;
    IF p_base IS NOT NULL THEN
      l_base := ' xml:base="' || p_base || '"';
    END IF;
    IF p_lang IS NOT NULL THEN
      l_lang := ' xml:lang="' || p_lang || '"';
    END IF;
    IF p_space IS NOT NULL THEN
      l_space := ' xml:space="' || p_space || '"';
    END IF;
    IF p_xlink THEN
      l_link := ' xmlns:xlink="http://www.w3.org/1999/xlink"';
    END IF;
    IF p_viewbox IS NOT NULL THEN
      l_viewbox := ' viewBox="' || p_viewbox || '"';
    END IF;
    IF p_preserveaspectratio IS NOT NULL THEN
      l_preserveaspectratio := ' preserveAspectRatio="' || p_preserveaspectratio || '"';
    END IF;
    IF p_zoomandpan IS NOT NULL THEN
      l_zoomandpan := ' zoomAndPan="' || p_zoomandpan || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
  
    RETURN to_clob ('<svg' || l_ns || l_version || l_baseprofile || l_contentscripttype || l_contentstyletype || l_base || l_lang || l_space || l_link || l_id || p_presentation || l_class || l_style || ' width="' || p_width || '" height="' || p_height || '"' || l_x || l_y || l_viewbox || l_preserveaspectratio || l_zoomandpan || '>' || chr(13) || chr(10) ||
           p_content || chr(13) || chr(10) ||
           '</svg>');
    
  END svg_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The SVG drawing can supply a <title> description string where the description is text-only.
  --
  -- Parameters:
  --   @p_content = The content for the element
  -- Returns:
  --   <title>...</title> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION title_element (p_content IN VARCHAR2)
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN '<title>' || p_content || '</title>' || chr(13) || chr(10);
  END title_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The SVG drawing can supply a <desc> description string where the description is text-only.
  --
  -- Parameters:
  --   @p_content = The content for the element
  -- Returns:
  --   <desc>...</desc> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION desc_element (p_content IN VARCHAR2)
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN '<desc>' || p_content || '</desc>' || chr(13) || chr(10);
  END desc_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <defs> element is a container element for referenced elements.
  --
  -- Parameters:
  --   @p_elements     = Referenced elements
  --   @p_presentation = The presentation attributes
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <defs>...</defs> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION defs_element (
    p_elements     IN VARCHAR2
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
    
  BEGIN
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
  
    RETURN '<defs' || p_presentation || l_class || l_style || l_transform || '>' || chr(13) || chr(10) ||
           p_elements ||
           '</defs>' || chr(13) || chr(10);
  END defs_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: SVG provides an <a> element, to indicate web links.
  --
  -- Parameters:
  --   @p_elements      = Referenced elements
  --   @p_id            = The unique name to an element
  --   @p_xlink_href    = "<IRI>"
  --   @p_xlink_show    = "new" | "replace"
  --   @p_xlink_actuate = "onRequest"
  --   @p_target        = "_replace" | "_self" | "_parent" | "_top" | "_blank" | "<XML-Name>"
  --   @p_presentation  = The presentation attributes
  --   @p_class         = A class name or set of class names to an element
  --   @p_style         = The style information for the current element
  --   @p_transform     = matrix(<a> <b> <c> <d> <e> <f>)
  --                      translate(<tx> [<ty>])
  --                      scale(<sx> [<sy>])
  --                      rotate(<rotate-angle> [<cx> <cy>])
  --                      skewX(<skew-angle>)
  --                      skewY(<skew-angle>)
  -- Returns:
  --   <a>...</a> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION a_element (
    p_elements      IN VARCHAR2
  , p_id            IN VARCHAR2 DEFAULT NULL
  , p_xlink_href    IN VARCHAR2 DEFAULT NULL
  , p_xlink_show    IN VARCHAR2 DEFAULT NULL
  , p_xlink_actuate IN VARCHAR2 DEFAULT NULL
  , p_target        IN VARCHAR2 DEFAULT NULL
  , p_presentation  IN VARCHAR2 DEFAULT NULL
  , p_class         IN VARCHAR2 DEFAULT NULL
  , p_style         IN VARCHAR2 DEFAULT NULL
  , p_transform     IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id            VARCHAR2(100);
    l_xlink_href    VARCHAR2(255);
    l_xlink_show    VARCHAR2(100);
    l_xlink_actuate VARCHAR2(100);
    l_target        VARCHAR2(100);
    l_class         VARCHAR2(100);
    l_style         VARCHAR2(100);
    l_transform     VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_xlink_href IS NOT NULL THEN
      l_xlink_href := ' xlink:href="' || p_xlink_href || '"';
    END IF;
    IF p_xlink_show IS NOT NULL THEN
      l_xlink_show := ' xlink:show="' || p_xlink_show || '"';
    END IF;
    IF p_xlink_actuate IS NOT NULL THEN
      l_xlink_actuate := ' xlink:actuate="' || p_xlink_actuate || '"';
    END IF;
    IF p_target IS NOT NULL THEN
      l_target := ' target="' || p_target || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<a' || l_id || l_xlink_href || l_xlink_show || l_xlink_actuate || l_target || p_presentation || l_class || l_style || l_transform || '>' || p_elements || '</a>' || chr(13) || chr(10);
    
  END a_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: A <script> element is equivalent to the <script> element in HTML and thus is the place for scripts.
  --
  -- Parameters:
  --   @p_content      = The content for the element
  --   @p_xlinkhref    = "<iri>"
  --   @p_content_type = "content-type"
  -- Returns:
  --   <script>...</script> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION script_element (
    p_content      IN VARCHAR2 DEFAULT NULL
  , p_xlinkhref    IN VARCHAR2 DEFAULT NULL
  , p_content_type IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_xlinkhref    VARCHAR2(100);
    l_content      VARCHAR2(4000);
    l_content_type VARCHAR2(100);
    
  BEGIN
    IF p_content IS NULL AND p_xlinkhref IS NULL THEN
      RAISE_APPLICATION_ERROR (-20001, 'The parameters p_content and p_xlinkhref cannot be both null.');
    END IF;
    IF p_xlinkhref IS NOT NULL THEN
      l_xlinkhref := ' xlink:href="' || p_xlinkhref || '" />';
    ELSIF p_content IS NOT NULL THEN
      l_xlinkhref := '>';
      l_content := '<![CDATA[' || chr(13) || chr(10) || p_content || chr(13) || chr(10) || ']]>';
    END IF;
    IF p_content_type IS NOT NULL THEN
      l_content_type := ' type="' || p_content_type || '"';
    END IF;
    
    RETURN '<script' || l_content_type || l_xlinkhref || l_content || '</script>' || chr(13) || chr(10);
    
  END script_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <g> element is a container element for grouping together related graphics elements.
  --
  -- Parameters:
  --   @p_elements     = Graphics element
  --   @p_id           = The unique name to an element
  --   @p_presentation = The presentation attributes
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <g>...</g> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION group_element (
    p_elements     IN VARCHAR2
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<g' || l_id || p_presentation || l_class || l_style || l_transform || '>' || chr(13) || chr(10) ||
           p_elements || chr(13) || chr(10) ||
           '</g>' || chr(13) || chr(10);
  END group_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <symbol> element is used to define graphical template objects which can be instantiated by a <use> element.
  --
  -- Parameters:
  --   @p_content             = The content for the element
  --   @p_id                  = The unique name to an element
  --   @p_presentation        = The presentation attributes
  --   @p_class               = A class name or set of class names to an element
  --   @p_style               = The style information for the current element
  --   @p_preserveaspectratio = "none | xMinYMin | xMidYMin | xMaxYMin
  --                                  | xMinYMid | xMidYMid | xMaxYMid
  --                                  | xMinYMax | xMidYMax | xMaxYMax
  --                             meet | slice"
  --   @p_viewbox             = "<min-x> <min-y> <width> <height>"
  -- Returns:
  --   <symbol>...</symbol> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION symbol_element (
    p_content             IN VARCHAR2
  , p_id                  IN VARCHAR2 DEFAULT NULL
  , p_presentation        IN VARCHAR2 DEFAULT NULL
  , p_class               IN VARCHAR2 DEFAULT NULL
  , p_style               IN VARCHAR2 DEFAULT NULL
  , p_preserveaspectratio IN VARCHAR2 DEFAULT NULL
  , p_viewbox             IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id                  VARCHAR2(100);
    l_class               VARCHAR2(100);
    l_style               VARCHAR2(100);
    l_preserveaspectratio VARCHAR2(100);
    l_viewbox             VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_preserveaspectratio IS NOT NULL THEN
      l_preserveaspectratio := ' preserveAspectRatio="' || p_preserveaspectratio || '"';
    END IF;
    IF p_viewbox IS NOT NULL THEN
      l_viewbox := ' viewBox="' || p_viewbox || '"';
    END IF;
    
    RETURN '<symbol' || l_id || p_presentation || l_class || l_style || l_preserveaspectratio || l_viewbox || '>' || chr(13) || chr(10) ||
           p_content || chr(13) || chr(10) ||
           '</symbol>' || chr(13) || chr(10);
  END symbol_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <use> element references another element and indicates that the graphical contents of that element
  --              is included/drawn at that given point in the document.
  --
  -- Parameters:
  --   @p_xlinkhref    = "<iri>"
  --   @p_x            = "<coordinate> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_y            = "<coordinate> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_width        = "<length>"
  --   @p_height       = "<length>"
  --   @p_presentation = The presentation attributes
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <use /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION use_element (
    p_xlinkhref    IN VARCHAR2
  , p_x            IN VARCHAR2 DEFAULT NULL
  , p_y            IN VARCHAR2 DEFAULT NULL
  , p_width        IN VARCHAR2 DEFAULT NULL
  , p_height       IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_x          VARCHAR2(100);
    l_y          VARCHAR2(100);
    l_width      VARCHAR2(100);
    l_height     VARCHAR2(100);
    l_class      VARCHAR2(100);
    l_style      VARCHAR2(100);
    l_transform  VARCHAR2(100);
    
  BEGIN
    IF p_x IS NOT NULL THEN
      l_x := ' x="' || p_x || '"';
    END IF;
    IF p_y IS NOT NULL THEN
      l_y := ' y="' || p_y || '"';
    END IF;
    IF p_width IS NOT NULL THEN
      l_width := ' width="' || p_width || '"';
    END IF;
    IF p_height IS NOT NULL THEN
      l_height := ' height="' || p_height || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<use xlink:href="' || p_xlinkhref || '"' || l_x || l_y || l_width || l_height || p_presentation || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END use_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: Paths represent the outline of a shape which can be filled, stroked, used as a clipping path,
  --              or any combination of the three.
  --
  -- Parameters:
  --   @p_d            = "path data"
  --   @p_id           = The unique name to an element
  --   @p_pathlength   = "<number>"
  --   @p_presentation = The presentation attributes
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <path /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION path_element (
    p_d            IN VARCHAR2
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_pathlength   IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id         VARCHAR2(100);
    l_pathlength VARCHAR2(100);
    l_class      VARCHAR2(100);
    l_style      VARCHAR2(100);
    l_transform  VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_pathlength IS NOT NULL THEN
      l_pathlength := ' pathLength="' || p_pathlength || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<path' || l_id || ' d="' || p_d || '"' || l_pathlength || p_presentation || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END path_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: An XML attribute on an SVG element which specifies a value for a given property for that element.
  --
  -- Parameters:
  --   @p_text_anchor       = "start | middle | end | inherit"
  --   @p_fill              = "<paint>"
  --   @p_fill_rule         = "nonzero | evenodd | inherit"
  --   @p_fill_opacity      = "<opacity-value> | inherit"
  --   @p_stroke            = "<paint>"
  --   @p_stroke_width      = "<percentage> | <length> | inherit"
  --   @p_stroke_linecap    = "butt | round | square | inherit"
  --   @p_stroke_linejoin   = "miter | round | bevel | inherit"
  --   @p_stroke_miterlimit = "<miterlimit> | inherit"
  --   @p_stroke_dasharray  = "none | <dasharray> | inherit"
  --   @p_stroke_dashoffset = "<percentage> | <length> | inherit"
  --   @p_stroke_opacity    = "<opacity-value> | inherit"
  --   @p_stop_opacity      = "<opacity-value> | inherit"
  --   @p_opacity           = "<opacity-value> | inherit>
  --   @p_stop_color        = "currentColor | <color> <icccolor> | inherit"
  --   @p_color             = "<color> | inherit"
  --                           <color> = white = rgb(255,255,255) = rgb(100%,100%,100%) = #fff = #ffffff
  --                           <color> = black blue brown coral cyan gold grey green indigo lavender lime
  --                                     magenta maroon navy olive orange orchid tomato pink purple red
  --                                     salmon silver violet white yellow
  --   @p_font_family       = "<family-name>"
  --   @p_font_style        = "normal | italic | oblique | inherit"
  --   @p_font_variant      = "normal | small-caps | inherit"
  --   @p_font_weight       = "normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 | inherit"
  --   @p_font_stretch      = "normal | wider | narrower | ultra-condensed | extra-condensed | condensed | semi-condensed | semi-expanded | expanded | extra-expanded | ultra-expanded | inherit"
  --   @p_font_size         = "<absolute-size> | <relative-size> | <length> | <percentage> | inherit"
  --   @p_font_size_adjust  = "<number> | none | inherit"
  --   @p_font              = "[ [ <'font-style'> || <'font-variant'> || <'font-weight'> ]? <'font-size'> [ / <'line-height'> ]? <'font-family'> ] | caption | icon | menu | message-box | small-caption | status-bar | inherit"
  --   @p_kerning           = "auto | <length> | inherit"
  --   @p_letter_spacing    = "normal | <length> | inherit"
  --   @p_word_spacing      = "normal | <length> | inherit"
  --   @p_text_decoration   = "none | [ underline || overline || line-through || blink ] | inherit"
  -- Returns:
  --   A lista de atributos
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION presentation_attribute (
    p_text_anchor       IN VARCHAR2 DEFAULT NULL
  , p_fill              IN VARCHAR2 DEFAULT NULL
  , p_fill_rule         IN VARCHAR2 DEFAULT NULL
  , p_fill_opacity      IN VARCHAR2 DEFAULT NULL
  , p_stroke            IN VARCHAR2 DEFAULT NULL
  , p_stroke_width      IN VARCHAR2 DEFAULT NULL
  , p_stroke_linecap    IN VARCHAR2 DEFAULT NULL
  , p_stroke_linejoin   IN VARCHAR2 DEFAULT NULL
  , p_stroke_miterlimit IN VARCHAR2 DEFAULT NULL
  , p_stroke_dasharray  IN VARCHAR2 DEFAULT NULL
  , p_stroke_dashoffset IN VARCHAR2 DEFAULT NULL
  , p_stroke_opacity    IN VARCHAR2 DEFAULT NULL
  , p_stop_opacity      IN VARCHAR2 DEFAULT NULL
  , p_opacity           IN VARCHAR2 DEFAULT NULL
  , p_stop_color        IN VARCHAR2 DEFAULT NULL
  , p_color             IN VARCHAR2 DEFAULT NULL
  , p_font_family       IN VARCHAR2 DEFAULT NULL
  , p_font_style        IN VARCHAR2 DEFAULT NULL
  , p_font_variant      IN VARCHAR2 DEFAULT NULL
  , p_font_weight       IN VARCHAR2 DEFAULT NULL
  , p_font_stretch      IN VARCHAR2 DEFAULT NULL
  , p_font_size         IN VARCHAR2 DEFAULT NULL
  , p_font_size_adjust  IN VARCHAR2 DEFAULT NULL
  , p_font              IN VARCHAR2 DEFAULT NULL
  , p_kerning           IN VARCHAR2 DEFAULT NULL
  , p_letter_spacing    IN VARCHAR2 DEFAULT NULL
  , p_word_spacing      IN VARCHAR2 DEFAULT NULL
  , p_text_decoration   IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_attributes VARCHAR2(1000);
    
  BEGIN
    IF p_text_anchor IS NOT NULL THEN
      l_attributes := l_attributes || ' text-anchor="' || p_text_anchor || '"';
    END IF;
    IF p_fill IS NOT NULL THEN
      l_attributes := l_attributes || ' fill="' || p_fill || '"';
    END IF;
    IF p_fill_rule IS NOT NULL THEN
      l_attributes := l_attributes || ' fill-rule="' || p_fill_rule || '"';
    END IF;
    IF p_fill_opacity IS NOT NULL THEN
      l_attributes := l_attributes || ' fill-opacity="' || p_fill_opacity || '"';
    END IF;
    IF p_stroke IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke="' || p_stroke || '"';
    END IF;
    IF p_stroke_width IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-width="' || p_stroke_width || '"';
    END IF;
    IF p_stroke_linecap IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-linecap="' || p_stroke_linecap || '"';
    END IF;
    IF p_stroke_linejoin IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-linejoin="' || p_stroke_linejoin || '"';
    END IF;
    IF p_stroke_miterlimit IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-miterlimit="' || p_stroke_miterlimit || '"';
    END IF;
    IF p_stroke_dasharray IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-dasharray="' || p_stroke_dasharray || '"';
    END IF;
    IF p_stroke_dashoffset IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-dashoffset="' || p_stroke_dashoffset || '"';
    END IF;
    IF p_stroke_opacity IS NOT NULL THEN
      l_attributes := l_attributes || ' stroke-opacity="' || p_stroke_opacity || '"';
    END IF;
    IF p_stop_opacity IS NOT NULL THEN
      l_attributes := l_attributes || ' stop-opacity="' || p_stop_opacity || '"';
    END IF;
    IF p_opacity IS NOT NULL THEN
      l_attributes := l_attributes || ' opacity="' || p_opacity || '"';
    END IF;
    IF p_stop_color IS NOT NULL THEN
      l_attributes := l_attributes || ' stop-color="' || p_stop_color || '"';
    END IF;
    IF p_color IS NOT NULL THEN
      l_attributes := l_attributes || ' color="' || p_color || '"';
    END IF;
    IF p_font_family IS NOT NULL THEN
      l_attributes := l_attributes || ' font-family="' || p_font_family || '"';
    END IF;
    IF p_font_style IS NOT NULL THEN
      l_attributes := l_attributes || ' font-style="' || p_font_style || '"';
    END IF;
    IF p_font_variant IS NOT NULL THEN
      l_attributes := l_attributes || ' font-variant="' || p_font_variant || '"';
    END IF;
    IF p_font_weight IS NOT NULL THEN
      l_attributes := l_attributes || ' font-weight="' || p_font_weight || '"';
    END IF;
    IF p_font_stretch IS NOT NULL THEN
      l_attributes := l_attributes || ' font-stretch="' || p_font_stretch || '"';
    END IF;
    IF p_font_size IS NOT NULL THEN
      l_attributes := l_attributes || ' font-size="' || p_font_size || '"';
    END IF;
    IF p_font_size_adjust IS NOT NULL THEN
      l_attributes := l_attributes || ' font-size-adjust="' || p_font_size_adjust || '"';
    END IF;
    IF p_font IS NOT NULL THEN
      l_attributes := l_attributes || ' font="' || p_font || '"';
    END IF;
    IF p_kerning IS NOT NULL THEN
      l_attributes := l_attributes || ' kerning="' || p_kerning || '"';
    END IF;
    IF p_letter_spacing IS NOT NULL THEN
      l_attributes := l_attributes || ' letter-spacing="' || p_letter_spacing || '"';
    END IF;
    IF p_word_spacing IS NOT NULL THEN
      l_attributes := l_attributes || ' word-spacing="' || p_word_spacing || '"';
    END IF;
    IF p_text_decoration IS NOT NULL THEN
      l_attributes := l_attributes || ' text-decoration="' || p_text_decoration || '"';
    END IF;
          
  RETURN l_attributes;
  
  END presentation_attribute;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <text> element defines a graphics element consisting of text.
  --
  -- Parameters:
  --   @p_content      = The content for the element
  --   @p_x            = "<list-of-coordinates>"
  --   @p_y            = "<list-of-coordinates>"
  --   @p_dx           = "<list-of-lengths>"
  --   @p_dy           = "<list-of-lengths>"
  --   @p_rotate       = "<list-of-numbers>"
  --   @p_textlength   = "<length>"
  --   @p_lengthadjust = "spacing | spacingAndGlyphs"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <text>...</text> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION text_element (
    p_content      IN VARCHAR2
  , p_x            IN VARCHAR2 DEFAULT NULL
  , p_y            IN VARCHAR2 DEFAULT NULL
  , p_dx           IN VARCHAR2 DEFAULT NULL
  , p_dy           IN VARCHAR2 DEFAULT NULL
  , p_rotate       IN VARCHAR2 DEFAULT NULL
  , p_textlength   IN VARCHAR2 DEFAULT NULL
  , p_lengthadjust IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_x            VARCHAR2(100);
    l_y            VARCHAR2(100);
    l_dx           VARCHAR2(100);
    l_dy           VARCHAR2(100);
    l_rotate       VARCHAR2(100);
    l_textlength   VARCHAR2(100);
    l_lengthadjust VARCHAR2(100);
    l_id           VARCHAR2(100);
    l_class        VARCHAR2(100);
    l_style        VARCHAR2(100);
    l_transform    VARCHAR2(100);
    
  BEGIN
    IF p_x IS NOT NULL THEN
      l_x := ' x="' || p_x || '"';
    END IF;
    IF p_y IS NOT NULL THEN
      l_y := ' y="' || p_y || '"';
    END IF;
    IF p_dx IS NOT NULL THEN
      l_dx := ' dx="' || p_dx || '"';
    END IF;
    IF p_dy IS NOT NULL THEN
      l_dy := ' dy="' || p_dy || '"';
    END IF;
    IF p_rotate IS NOT NULL THEN
      l_rotate := ' rotate="' || p_rotate || '"';
    END IF;
    IF p_textlength IS NOT NULL THEN
      l_textlength := ' textLength="' || p_textlength || '"';
    END IF;
    IF p_lengthadjust IS NOT NULL THEN
      l_lengthadjust := ' lengthAdjust="' || p_lengthadjust || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
      
    RETURN '<text' || l_x || l_y || l_dx || l_dy || l_rotate || l_textlength || l_lengthadjust || p_presentation || l_id || l_class || l_style || l_transform || '>' || chr(13) || chr(10) ||
           p_content || chr(13) || chr(10) ||
           '</text>' || chr(13) || chr(10);
           
  END text_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: Within a <text> element, text and font properties and the current text position can be adjusted
  --              with absolute or relative coordinate values by including a <tspan> element.
  --
  -- Parameters:
  --   @p_content      = The content for the element
  --   @p_x            = "<list-of-coordinates>"
  --   @p_y            = "<list-of-coordinates>"
  --   @p_dx           = "<list-of-lengths>"
  --   @p_dy           = "<list-of-lengths>"
  --   @p_rotate       = "<list-of-numbers>"
  --   @p_textlength   = "<length>"
  --   @p_lengthadjust = "spacing | spacingAndGlyphs"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  -- Returns:
  --   <tspan>...</tspan> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION tspan_element (
    p_content      IN VARCHAR2
  , p_x            IN VARCHAR2 DEFAULT NULL
  , p_y            IN VARCHAR2 DEFAULT NULL
  , p_dx           IN VARCHAR2 DEFAULT NULL
  , p_dy           IN VARCHAR2 DEFAULT NULL
  , p_rotate       IN VARCHAR2 DEFAULT NULL
  , p_textlength   IN VARCHAR2 DEFAULT NULL
  , p_lengthadjust IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_x            VARCHAR2(100);
    l_y            VARCHAR2(100);
    l_dx           VARCHAR2(100);
    l_dy           VARCHAR2(100);
    l_rotate       VARCHAR2(100);
    l_textlength   VARCHAR2(100);
    l_lengthadjust VARCHAR2(100);
    l_id           VARCHAR2(100);
    l_class        VARCHAR2(100);
    l_style        VARCHAR2(100);
    
  BEGIN
    IF p_x IS NOT NULL THEN
      l_x := ' x="' || p_x || '"';
    END IF;
    IF p_y IS NOT NULL THEN
      l_y := ' y="' || p_y || '"';
    END IF;
    IF p_dx IS NOT NULL THEN
      l_dx := ' dx="' || p_dx || '"';
    END IF;
    IF p_dy IS NOT NULL THEN
      l_dy := ' dy="' || p_dy || '"';
    END IF;
    IF p_rotate IS NOT NULL THEN
      l_rotate := ' rotate="' || p_rotate || '"';
    END IF;
    IF p_textlength IS NOT NULL THEN
      l_textlength := ' textLength="' || p_textlength || '"';
    END IF;
    IF p_lengthadjust IS NOT NULL THEN
      l_lengthadjust := ' lengthAdjust="' || p_lengthadjust || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<tspan' || l_x || l_y || l_dx || l_dy || l_rotate || l_textlength || l_lengthadjust || p_presentation || l_id || l_class || l_style || '>' || p_content || '</tspan>';
    
  END tspan_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The textual content for a <text> can be either character data directly embedded within
  --              the <text> element or the character data content of a referenced element, where the referencing
  --              is specified with a <tref> element.
  --
  -- Parameters:
  --   @p_xlinkhref    = "<iri>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  -- Returns:
  --   <tref /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION tref_element (
    p_xlinkhref    IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_xlinkhref VARCHAR2(100);
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    
  BEGIN
    IF p_xlinkhref IS NOT NULL THEN
      l_xlinkhref := ' xlink:href="' || p_xlinkhref || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<tref' || l_xlinkhref || p_presentation || l_id || l_class || l_style || ' />' || chr(13) || chr(10);
    
  END tref_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: In addition to text drawn in a straight line, SVG also includes the ability to place text along
  --              the shape of a <path> element.
  --
  -- Parameters:
  --   @p_content      = The content for the element
  --   @p_xlinkhref    = "<iri>"
  --   @p_startoffset  = "<length>"
  --   @p_method       = "align | stretch"
  --   @p_spacing      = "auto | exact"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  -- Returns:
  --   <textPath>...</textPath> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION textpath_element (
    p_content      IN VARCHAR2
  , p_xlinkhref    IN VARCHAR2 DEFAULT NULL
  , p_startoffset  IN VARCHAR2 DEFAULT NULL
  , p_method       IN VARCHAR2 DEFAULT NULL
  , p_spacing      IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_xlinkhref   VARCHAR2(100);
    l_startoffset VARCHAR2(100);
    l_method      VARCHAR2(100);
    l_spacing     VARCHAR2(100);
    l_id          VARCHAR2(100);
    l_class       VARCHAR2(100);
    l_style       VARCHAR2(100);
    
  BEGIN
    IF p_xlinkhref IS NOT NULL THEN
      l_xlinkhref := ' xlink:href="' || p_xlinkhref || '"';
    END IF;
    IF p_startoffset IS NOT NULL THEN
      l_startoffset := ' startOffset="' || p_startoffset || '"';
    END IF;
    IF p_method IS NOT NULL THEN
      l_method := ' method="' || p_method || '"';
    END IF;
    IF p_spacing IS NOT NULL THEN
      l_spacing := ' spacing="' || p_spacing || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<textPath' || l_xlinkhref || l_startoffset || l_method || l_spacing || p_presentation || l_id || l_class || l_style || '>' || p_content || '</textPath>';
          
  END textpath_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <font> element defines an SVG font.
  --
  -- Parameters:
  --   @p_content      = The content for the element
  --   @p_id           = The unique name to an element
  --   @p_horizoriginx = "<number>"
  --   @p_horizoriginy = "<number>"
  --   @p_horizadvx    = "<number>"
  --   @p_vertoriginx  = "<number>"
  --   @p_vertoriginy  = "<number>"
  --   @p_vertadvy     = "<number>"
  --   @p_presentation = The presentation attributes
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  -- Returns:
  --   <font>...</font> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION font_element (
    p_content      IN VARCHAR2
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_horizoriginx IN NUMBER   DEFAULT NULL
  , p_horizoriginy IN NUMBER   DEFAULT NULL
  , p_horizadvx    IN NUMBER   DEFAULT NULL
  , p_vertoriginx  IN NUMBER   DEFAULT NULL
  , p_vertoriginy  IN NUMBER   DEFAULT NULL
  , p_vertadvy     IN NUMBER   DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id           VARCHAR2(100);
    l_horizoriginx VARCHAR2(100);
    l_horizoriginy VARCHAR2(100);
    l_horizadvx    VARCHAR2(100);
    l_vertoriginx  VARCHAR2(100);
    l_vertoriginy  VARCHAR2(100);
    l_vertadvy     VARCHAR2(100);
    l_class        VARCHAR2(100);
    l_style        VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_horizoriginx IS NOT NULL THEN
      l_horizoriginx := ' horiz-origin-x="' || p_horizoriginx || '"';
    END IF;
    IF p_horizoriginy IS NOT NULL THEN
      l_horizoriginy := ' horiz-origin-y="' || p_horizoriginy || '"';
    END IF;
    IF p_horizadvx IS NOT NULL THEN
      l_horizadvx := ' horiz-adv-x="' || p_horizadvx || '"';
    END IF;
    IF p_vertoriginx IS NOT NULL THEN
      l_vertoriginx := ' vert-origin-x="' || p_vertoriginx || '"';
    END IF;
    IF p_vertoriginy IS NOT NULL THEN
      l_vertoriginy := ' vert-origin-y="' || p_vertoriginy || '"';
    END IF;
    IF p_vertadvy IS NOT NULL THEN
      l_vertadvy := ' vert-adv-y="' || p_vertadvy || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<font' || l_id || l_horizoriginx || l_horizoriginy || l_horizadvx || l_vertoriginx || l_vertoriginy || l_vertadvy || p_presentation || l_class || l_style || '>' || chr(13) || chr(10) ||
           p_content || chr(13) || chr(10) ||
           '</font>' || chr(13) || chr(10);
      
  END font_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The font-face attributes.
  --
  -- Parameters:
  --   @p_font_family             = "<string>"
  --   @p_font_style              = "all | [ normal | italic | oblique] [, [normal | italic | oblique]]*"
  --   @p_font_variant            = "[normal | small-caps] [,[normal | small-caps]]*"
  --   @p_font_weight             = "all | [normal | bold | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900] [, [normal | bold | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900]]*"
  --   @p_font_stretch            = "all | [ normal | ultra-condensed | extra-condensed | condensed | semi-condensed | semi-expanded | expanded | extra-expanded | ultra-expanded] [, [ normal | ultra-condensed | extra-condensed | condensed | semi-condensed | semi-expanded | expanded | extra-expanded | ultra-expanded] ]*"
  --   @p_font_size               = "<string>"
  --   @p_unicode_range           = "<urange> [, <urange>]*"
  --   @p_units_per_em            = "<number>"
  --   @p_panose_1                = "[<integer>]{10}"
  --   @p_stemv                   = "<number>"
  --   @p_stemh                   = "<number>"
  --   @p_slope                   = "<number>"
  --   @p_cap_height              = "<number>"
  --   @p_x_height                = "<number>"
  --   @p_accent_height           = "<number>"
  --   @p_ascent                  = "<number>"
  --   @p_descent                 = "<number>"
  --   @p_widths                  = "<string>"
  --   @p_bbox                    = "<string>"
  --   @p_ideographic             = "<number>"
  --   @p_alphabetic              = "<number>"
  --   @p_mathematical            = "<number>"
  --   @p_hanging                 = "<number>"
  --   @p_v_ideographic           = "<number>"
  --   @p_v_alphabetic            = "<number>"
  --   @p_v_mathematical          = "<number>"
  --   @p_v_hanging               = "<number>"
  --   @p_underline_position      = "<number>"
  --   @p_underline_thickness     = "<number>"
  --   @p_strikethrough_position  = "<number>"
  --   @p_strikethrough_thickness = "<number>"
  --   @p_overline_position       = "<number>"
  --   @p_overline_thickness      = "<number>"
  -- Returns:
  --   A lista dos atributos
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION font_face_attribute (
    p_font_family             IN VARCHAR2 DEFAULT NULL
  , p_font_style              IN VARCHAR2 DEFAULT NULL
  , p_font_variant            IN VARCHAR2 DEFAULT NULL
  , p_font_weight             IN VARCHAR2 DEFAULT NULL
  , p_font_stretch            IN VARCHAR2 DEFAULT NULL
  , p_font_size               IN VARCHAR2 DEFAULT NULL
  , p_unicode_range           IN VARCHAR2 DEFAULT NULL
  , p_units_per_em            IN VARCHAR2 DEFAULT NULL
  , p_panose_1                IN VARCHAR2 DEFAULT NULL
  , p_stemv                   IN VARCHAR2 DEFAULT NULL
  , p_stemh                   IN VARCHAR2 DEFAULT NULL
  , p_slope                   IN VARCHAR2 DEFAULT NULL
  , p_cap_height              IN VARCHAR2 DEFAULT NULL
  , p_x_height                IN VARCHAR2 DEFAULT NULL
  , p_accent_height           IN VARCHAR2 DEFAULT NULL
  , p_ascent                  IN VARCHAR2 DEFAULT NULL
  , p_descent                 IN VARCHAR2 DEFAULT NULL
  , p_widths                  IN VARCHAR2 DEFAULT NULL
  , p_bbox                    IN VARCHAR2 DEFAULT NULL
  , p_ideographic             IN VARCHAR2 DEFAULT NULL
  , p_alphabetic              IN VARCHAR2 DEFAULT NULL
  , p_mathematical            IN VARCHAR2 DEFAULT NULL
  , p_hanging                 IN VARCHAR2 DEFAULT NULL
  , p_v_ideographic           IN VARCHAR2 DEFAULT NULL
  , p_v_alphabetic            IN VARCHAR2 DEFAULT NULL
  , p_v_mathematical          IN VARCHAR2 DEFAULT NULL
  , p_v_hanging               IN VARCHAR2 DEFAULT NULL
  , p_underline_position      IN VARCHAR2 DEFAULT NULL
  , p_underline_thickness     IN VARCHAR2 DEFAULT NULL
  , p_strikethrough_position  IN VARCHAR2 DEFAULT NULL
  , p_strikethrough_thickness IN VARCHAR2 DEFAULT NULL
  , p_overline_position       IN VARCHAR2 DEFAULT NULL
  , p_overline_thickness      IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_attributes VARCHAR2(4000);
    
  BEGIN
    IF p_font_family IS NOT NULL THEN
      l_attributes := l_attributes || ' font-family="' || p_font_family || '"';
    END IF;
    IF p_font_style IS NOT NULL THEN
      l_attributes := l_attributes || ' font-style="' || p_font_style || '"';
    END IF;
    IF p_font_variant IS NOT NULL THEN
      l_attributes := l_attributes || ' font-variant="' || p_font_variant || '"';
    END IF;
    IF p_font_weight IS NOT NULL THEN
      l_attributes := l_attributes || ' font-weight="' || p_font_weight || '"';
    END IF;
    IF p_font_stretch IS NOT NULL THEN
      l_attributes := l_attributes || ' font-stretch="' || p_font_stretch || '"';
    END IF;
    IF p_font_size IS NOT NULL THEN
      l_attributes := l_attributes || ' font-size="' || p_font_size || '"';
    END IF;
    IF p_unicode_range IS NOT NULL THEN
      l_attributes := l_attributes || ' unicode-range="' || p_unicode_range || '"';
    END IF;
    IF p_units_per_em IS NOT NULL THEN
      l_attributes := l_attributes || ' units-per-em="' || p_units_per_em || '"';
    END IF;
    IF p_panose_1 IS NOT NULL THEN
      l_attributes := l_attributes || ' panose-1="' || p_panose_1 || '"';
    END IF;
    IF p_stemv IS NOT NULL THEN
      l_attributes := l_attributes || ' stemv="' || p_stemv || '"';
    END IF;
    IF p_stemh IS NOT NULL THEN
      l_attributes := l_attributes || ' stemh="' || p_stemh || '"';
    END IF;
    IF p_slope IS NOT NULL THEN
      l_attributes := l_attributes || ' slope="' || p_slope || '"';
    END IF;
    IF p_cap_height IS NOT NULL THEN
      l_attributes := l_attributes || ' cap-height="' || p_cap_height || '"';
    END IF;
    IF p_x_height IS NOT NULL THEN
      l_attributes := l_attributes || ' x-height="' || p_x_height || '"';
    END IF;
    IF p_accent_height IS NOT NULL THEN
      l_attributes := l_attributes || ' accent-height="' || p_accent_height || '"';
    END IF;
    IF p_ascent IS NOT NULL THEN
      l_attributes := l_attributes || ' ascent="' || p_ascent || '"';
    END IF;
    IF p_descent IS NOT NULL THEN
      l_attributes := l_attributes || ' descent="' || p_descent || '"';
    END IF;
    IF p_widths IS NOT NULL THEN
      l_attributes := l_attributes || ' widths="' || p_widths || '"';
    END IF;
    IF p_bbox IS NOT NULL THEN
      l_attributes := l_attributes || ' bbox="' || p_bbox || '"';
    END IF;
    IF p_ideographic IS NOT NULL THEN
      l_attributes := l_attributes || ' ideographic="' || p_ideographic || '"';
    END IF;
    IF p_alphabetic IS NOT NULL THEN
      l_attributes := l_attributes || ' alphabetic="' || p_alphabetic || '"';
    END IF;
    IF p_mathematical IS NOT NULL THEN
      l_attributes := l_attributes || ' mathematical="' || p_mathematical || '"';
    END IF;
    IF p_hanging IS NOT NULL THEN
      l_attributes := l_attributes || ' hanging="' || p_hanging || '"';
    END IF;
    IF p_v_ideographic IS NOT NULL THEN
      l_attributes := l_attributes || ' v-ideographic="' || p_v_ideographic || '"';
    END IF;
    IF p_v_alphabetic IS NOT NULL THEN
      l_attributes := l_attributes || ' v-alphabetic="' || p_v_alphabetic || '"';
    END IF;
    IF p_v_mathematical IS NOT NULL THEN
      l_attributes := l_attributes || ' v-mathematical="' || p_v_mathematical || '"';
    END IF;
    IF p_v_hanging IS NOT NULL THEN
      l_attributes := l_attributes || ' v-hanging="' || p_v_hanging || '"';
    END IF;
    IF p_underline_position IS NOT NULL THEN
      l_attributes := l_attributes || ' underline-position="' || p_underline_position || '"';
    END IF;
    IF p_underline_thickness IS NOT NULL THEN
      l_attributes := l_attributes || ' underline-thickness="' || p_underline_thickness || '"';
    END IF;
    IF p_strikethrough_position IS NOT NULL THEN
      l_attributes := l_attributes || ' strikethrough-position="' || p_strikethrough_position || '"';
    END IF;
    IF p_strikethrough_thickness IS NOT NULL THEN
      l_attributes := l_attributes || ' strikethrough-thickness="' || p_strikethrough_thickness || '"';
    END IF;
    IF p_overline_position IS NOT NULL THEN
      l_attributes := l_attributes || ' overline-position="' || p_overline_position || '"';
    END IF;
    IF p_overline_thickness IS NOT NULL THEN
      l_attributes := l_attributes || ' overline-thickness="' || p_overline_thickness || '"';
    END IF;
      
    RETURN l_attributes;
    
  END font_face_attribute;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <font-face-uri> element is used within a <font-face-src> element to reference a font defined
  --              inside or outside of the current SVG document.
  --
  -- Parameters:
  --   @p_xlinkhref = "<IRI>"
  -- Returns:
  --   <font-face-uri /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION font_face_uri_element (p_xlinkhref IN VARCHAR2)
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN '<font-face-uri xlink:href="' || p_xlinkhref || '" />';
  END font_face_uri_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <font-face-name> element is used within a <font-face-src> element to reference a local font by name.
  --
  -- Parameters:
  --   @p_name = "<anything>"
  -- Returns:
  --   <font-face-name /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION font_face_name_element (p_name IN VARCHAR2)
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN '<font-face-name name="' || p_name || '" />';
  END font_face_name_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <font-face-src> element, together with the <font-face-uri> and <font-face-format> elements,
  --              correspond to the src descriptor within an font-face rule.
  --
  -- Parameters:
  --   @p_id              = The unique name to an element
  --   @p_fonte_face_uri  = <font-face-uri /> element
  --   @p_fonte_face_name = <font-face-name /> element
  -- Returns:
  --   <font-face-src>...</font-face-src> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION font_face_src_element (
    p_id              IN VARCHAR2
  , p_fonte_face_uri  IN VARCHAR2 DEFAULT NULL
  , p_fonte_face_name IN VARCHAR2 DEFAULT NULL)
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN '<font-face-src id="' || p_id || '">' || p_fonte_face_uri || p_fonte_face_name || '</font-face-src>' || chr(13) || chr(10);
  END font_face_src_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <font-face> element corresponds directly to the font-face facility in CSS2.
  --              It can be used to describe the characteristics of any font, SVG font or otherwise.
  --
  -- Parameters:
  --   @p_font_face_src = <font-face-src>...</font-face-src> element
  --   @p_id            = The unique name to an element
  --   @p_presentation  = The presentation attributes
  -- Returns:
  --   <font-face>...</font-face> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION font_face_element (
    p_font_face_src IN VARCHAR2
  , p_id            IN VARCHAR2 DEFAULT NULL
  , p_presentation  IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
      
    RETURN '<font-face' || l_id || p_presentation || '>' || chr(13) || chr(10) ||
           p_font_face_src || '</font-face>' || chr(13) || chr(10);
    
  END font_face_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <glyph> element defines the graphics for a given glyph.
  --
  -- Parameters:
  --   @p_content      = The content for the element
  --   @p_id           = The unique name to an element
  --   @p_unicode      = "<string>"
  --   @p_glyphname    = "<name> [, <name> ]* "
  --   @p_d            = "path data"
  --   @p_orientation  = "h | v"
  --   @p_arabicform   = "initial | medial | terminal | isolated"
  --   @p_lang         = "%LanguageCodes;"
  --   @p_horizadvx    = "<number>"
  --   @p_vertoriginx  = "<number>"
  --   @p_vertoriginy  = "<number>"
  --   @p_vertadvy     = "<number>"
  --   @p_presentation = The presentation attributes
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  -- Returns:
  --   <glyph>...</glyph> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION glyph_element (
    p_content      IN VARCHAR2
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_unicode      IN VARCHAR2 DEFAULT NULL
  , p_glyphname    IN VARCHAR2 DEFAULT NULL
  , p_d            IN VARCHAR2 DEFAULT NULL
  , p_orientation  IN VARCHAR2 DEFAULT NULL
  , p_arabicform   IN VARCHAR2 DEFAULT NULL
  , p_lang         IN VARCHAR2 DEFAULT NULL
  , p_horizadvx    IN VARCHAR2 DEFAULT NULL
  , p_vertoriginx  IN VARCHAR2 DEFAULT NULL
  , p_vertoriginy  IN VARCHAR2 DEFAULT NULL
  , p_vertadvy     IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id          VARCHAR2(100);
    l_unicode     VARCHAR2(100);
    l_glyphname   VARCHAR2(100);
    l_d           VARCHAR2(100);
    l_orientation VARCHAR2(100);
    l_arabicform  VARCHAR2(100);
    l_lang        VARCHAR2(100);
    l_horizadvx   VARCHAR2(100);
    l_vertoriginx VARCHAR2(100);
    l_vertoriginy VARCHAR2(100);
    l_vertadvy    VARCHAR2(100);
    l_class       VARCHAR2(100);
    l_style       VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_unicode IS NOT NULL THEN
      l_unicode := ' unicode="' || p_unicode || '"';
    END IF;
    IF p_glyphname IS NOT NULL THEN
      l_glyphname := ' glyph-name="' || p_glyphname || '"';
    END IF;
    IF p_d IS NOT NULL THEN
      l_d := ' d="' || p_d || '"';
    END IF;
    IF p_orientation IS NOT NULL THEN
      l_orientation := ' orientation="' || p_orientation || '"';
    END IF;
    IF p_arabicform IS NOT NULL THEN
      l_arabicform := ' arabic-form="' || p_arabicform || '"';
    END IF;
    IF p_lang IS NOT NULL THEN
      l_lang := ' lang="' || p_lang || '"';
    END IF;
    IF p_horizadvx IS NOT NULL THEN
      l_horizadvx := ' horiz-adv-x="' || p_horizadvx || '"';
    END IF;
    IF p_vertoriginx IS NOT NULL THEN
      l_vertoriginx := ' vert-origin-x="' || p_vertoriginx || '"';
    END IF;
    IF p_vertoriginy IS NOT NULL THEN
      l_vertoriginy := ' vert-origin-y="' || p_vertoriginy || '"';
    END IF;
    IF p_vertadvy IS NOT NULL THEN
      l_vertadvy := ' vert-adv-y="' || p_vertadvy || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<glyph' || l_id || l_unicode || l_glyphname || l_d || l_orientation || l_arabicform || l_lang || l_horizadvx || l_vertoriginx || l_vertoriginy || l_vertadvy || p_presentation || l_class || l_style || '>' || chr(13) || chr(10) ||
           p_content || chr(13) || chr(10) ||
           '</glyph>' || chr(13) || chr(10);
    
  END glyph_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <rect> element defines a rectangle which is axis-aligned with the current user coordinate system.
  --
  -- Parameters:
  --   @p_x            = "<coordinate> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_y            = "<coordinate> = number ("em" | "ex" | "px" | "in" | "cm" | "mm" | "pt" | "pc" | "%")"
  --   @p_width        = "<length>"
  --   @p_height       = "<length>"
  --   @p_rx           = "<length>"
  --   @p_ry           = "<length>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <rect /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION rect_element (
    p_x            IN VARCHAR2 DEFAULT NULL
  , p_y            IN VARCHAR2 DEFAULT NULL
  , p_width        IN VARCHAR2 DEFAULT NULL
  , p_height       IN VARCHAR2 DEFAULT NULL
  , p_rx           IN VARCHAR2 DEFAULT NULL
  , p_ry           IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_x         VARCHAR2(100);
    l_y         VARCHAR2(100);
    l_width     VARCHAR2(100);
    l_height    VARCHAR2(100);
    l_rx        VARCHAR2(100);
    l_ry        VARCHAR2(100);
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
    
  BEGIN
    IF p_x IS NOT NULL THEN
      l_x := ' x="' || p_x || '"';
    END IF;
    IF p_y IS NOT NULL THEN
      l_y := ' y="' || p_y || '"';
    END IF;
    IF p_width IS NOT NULL THEN
      l_width := ' width="' || p_width || '"';
    END IF;
    IF p_height IS NOT NULL THEN
      l_height := ' height="' || p_height || '"';
    END IF;
    IF p_rx IS NOT NULL THEN
      l_rx := ' rx="' || p_rx || '"';
    END IF;
    IF p_ry IS NOT NULL THEN
      l_ry := ' ry="' || p_ry || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
      
    RETURN '<rect' || l_x || l_y || l_width || l_height || l_rx || l_ry || p_presentation || l_id || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END rect_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <circle> element defines a circle based on a center point and a radius.
  --
  -- Parameters:
  --   @p_cx           = "<coordinate>"
  --   @p_cy           = "<coordinate>"
  --   @p_r            = "<length>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <circle /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION circle_element (
    p_cx           IN VARCHAR2 DEFAULT NULL
  , p_cy           IN VARCHAR2 DEFAULT NULL
  , p_r            IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_cx        VARCHAR2(100);
    l_cy        VARCHAR2(100);
    l_r         VARCHAR2(100);
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
    
  BEGIN
    IF p_cx IS NOT NULL THEN
      l_cx := ' cx="' || p_cx || '"';
    END IF;
    IF p_cy IS NOT NULL THEN
      l_cy := ' cy="' || p_cy || '"';
    END IF;
    IF p_r IS NOT NULL THEN
      l_r := ' r="' || p_r || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
      
    RETURN '<circle' || l_cx || l_cy || l_r || p_presentation || l_id || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END circle_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <ellipse> element defines an ellipse which is axis-aligned with the current user coordinate system
  --              based on a center point and two radii.
  --
  -- Parameters:
  --   @p_cx           = "<coordinate>"
  --   @p_cy           = "<coordinate>"
  --   @p_rx           = "<length>"
  --   @p_ry           = "<length>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <ellipse /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION ellipse_element (
    p_cx           IN VARCHAR2 DEFAULT NULL
  , p_cy           IN VARCHAR2 DEFAULT NULL
  , p_rx           IN VARCHAR2 DEFAULT NULL
  , p_ry           IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_cx        VARCHAR2(100);
    l_cy        VARCHAR2(100);
    l_rx        VARCHAR2(100);
    l_ry        VARCHAR2(100);
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
    
  BEGIN
    IF p_cx IS NOT NULL THEN
      l_cx := ' cx="' || p_cx || '"';
    END IF;
    IF p_cy IS NOT NULL THEN
      l_cy := ' cy="' || p_cy || '"';
    END IF;
    IF p_rx IS NOT NULL THEN
      l_rx := ' rx="' || p_rx || '"';
    END IF;
    IF p_ry IS NOT NULL THEN
      l_ry := ' ry="' || p_ry || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<ellipse' || l_cx || l_cy || l_rx || l_ry || p_presentation || l_id || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END ellipse_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <line> element defines a line segment that starts at one point and ends at another.
  --
  -- Parameters:
  --   @p_x1           = "<coordinate>"
  --   @p_y1           = "<coordinate>"
  --   @p_x2           = "<coordinate>"
  --   @p_y2           = "<coordinate>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <line /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION line_element (
    p_x1           IN VARCHAR2 DEFAULT NULL
  , p_y1           IN VARCHAR2 DEFAULT NULL
  , p_x2           IN VARCHAR2 DEFAULT NULL
  , p_y2           IN VARCHAR2 DEFAULT NULL
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_x1        VARCHAR2(100);
    l_y1        VARCHAR2(100);
    l_x2        VARCHAR2(100);
    l_y2        VARCHAR2(100);
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
    
  BEGIN
    IF p_x1 IS NOT NULL THEN
      l_x1 := ' x1="' || p_x1 || '"';
    END IF;
    IF p_y1 IS NOT NULL THEN
      l_y1 := ' y1="' || p_y1 || '"';
    END IF;
    IF p_x2 IS NOT NULL THEN
      l_x2 := ' x2="' || p_x2 || '"';
    END IF;
    IF p_y2 IS NOT NULL THEN
      l_y2 := ' y2="' || p_y2 || '"';
    END IF;
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<line' || l_x1 || l_y1 || l_x2 || l_y2 || p_presentation || l_id || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END line_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <polyline> element defines a set of connected straight line segments.
  --
  -- Parameters:
  --   @p_points       = "<list-of-points>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <polyline /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION polyline_element (
    p_points       IN VARCHAR2
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
  
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<polyline points="' || p_points || '"' || p_presentation || l_id || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
      
  END polyline_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The <polygon> element defines a closed shape consisting of a set of connected straight line segments.
  --
  -- Parameters:
  --   @p_points       = "<list-of-points>"
  --   @p_presentation = The presentation attributes
  --   @p_id           = The unique name to an element
  --   @p_class        = A class name or set of class names to an element
  --   @p_style        = The style information for the current element
  --   @p_transform    = matrix(<a> <b> <c> <d> <e> <f>)
  --                     translate(<tx> [<ty>])
  --                     scale(<sx> [<sy>])
  --                     rotate(<rotate-angle> [<cx> <cy>])
  --                     skewX(<skew-angle>)
  --                     skewY(<skew-angle>)
  -- Returns:
  --   <polygon /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION polygon_element (
    p_points       IN VARCHAR2
  , p_presentation IN VARCHAR2 DEFAULT NULL
  , p_id           IN VARCHAR2 DEFAULT NULL
  , p_class        IN VARCHAR2 DEFAULT NULL
  , p_style        IN VARCHAR2 DEFAULT NULL
  , p_transform    IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id        VARCHAR2(100);
    l_class     VARCHAR2(100);
    l_style     VARCHAR2(100);
    l_transform VARCHAR2(100);
  
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<polygon points="' || p_points || '"' || p_presentation || l_id || l_class || l_style || l_transform || ' />' || chr(13) || chr(10);
    
  END polygon_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The raster image file (PNG or JPEG) or file with MIME type of "image/svg+xml" to be rendered into a given rectangle.
  --
  -- Parameters:
  --   @p_xlinkhref           = "<iri>"
  --   @p_x                   = "<coordinate>"
  --   @p_y                   = "<coordinate>"
  --   @p_width               = "<length>"
  --   @p_height              = "<length>"
  --   @p_preserveaspectratio = none | xMinYMin | xMidYMin | xMaxYMin
  --                                 | xMinYMid | xMidYMid (the default) | xMaxYMid
  --                                 | xMinYMax | xMidYMax | xMaxYMax
  --                            meet | slice
  --   @p_presentation        = The presentation attributes
  --   @p_class               = A class name or set of class names to an element
  --   @p_style               = The style information for the current element
  --   @p_transform           = matrix(<a> <b> <c> <d> <e> <f>)
  --                            translate(<tx> [<ty>])
  --                            scale(<sx> [<sy>])
  --                            rotate(<rotate-angle> [<cx> <cy>])
  --                            skewX(<skew-angle>)
  --                            skewY(<skew-angle>)
  -- Returns:
  --   <image>...</image> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION image_element (
    p_xlinkhref           IN VARCHAR2
  , p_x                   IN VARCHAR2 DEFAULT NULL
  , p_y                   IN VARCHAR2 DEFAULT NULL
  , p_width               IN VARCHAR2 DEFAULT NULL
  , p_height              IN VARCHAR2 DEFAULT NULL
  , p_preserveaspectratio IN VARCHAR2 DEFAULT NULL
  , p_presentation        IN VARCHAR2 DEFAULT NULL
  , p_class               IN VARCHAR2 DEFAULT NULL
  , p_style               IN VARCHAR2 DEFAULT NULL
  , p_transform           IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_x                   VARCHAR2(100);
    l_y                   VARCHAR2(100);
    l_width               VARCHAR2(100);
    l_height              VARCHAR2(100);
    l_preserveaspectratio VARCHAR2(100);
    l_class               VARCHAR2(100);
    l_style               VARCHAR2(100);
    l_transform           VARCHAR2(100);
    
  BEGIN
    IF p_x IS NOT NULL THEN
      l_x := ' x="' || p_x || '"';
    END IF;
    IF p_y IS NOT NULL THEN
      l_y := ' y="' || p_y || '"';
    END IF;
    IF p_width IS NOT NULL THEN
      l_width := ' width="' || p_width || '"';
    END IF;
    IF p_height IS NOT NULL THEN
      l_height := ' height="' || p_height || '"';
    END IF;
    IF p_preserveaspectratio IS NOT NULL THEN
      l_preserveaspectratio := ' preserveAspectRatio="' || p_preserveaspectratio || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    IF p_transform IS NOT NULL THEN
      l_transform := ' transform="' || p_transform || '"';
    END IF;
    
    RETURN '<image' || l_x || l_y || l_width || l_height || ' xlink:href="' || p_xlinkhref || '"' || l_preserveaspectratio || p_presentation || l_class || l_style || l_transform || '></image>' || chr(13) || chr(10);
    
  END image_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The linear gradients.
  --
  -- Parameters:
  --   @p_stops             = <stop> elements
  --   @p_id                = The unique name to an element
  --   @p_x1                = "<coordinate>"
  --   @p_y1                = "<coordinate>"
  --   @p_x2                = "<coordinate>"
  --   @p_y2                = "<coordinate>"
  --   @p_gradientunits     = "userSpaceOnUse | objectBoundingBox"
  --   @p_gradienttransform = "<transform-list>"
  --   @p_spreadmethod      = "pad | reflect | repeat"
  --   @p_xlinkhref         = "<iri>"
  --   @p_presentation      = The presentation attributes
  --   @p_class             = A class name or set of class names to an element
  --   @p_style             = The style information for the current element
  -- Returns:
  --   <linearGradient>...</linearGradient> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION lineargradient_element (
    p_stops             IN VARCHAR2
  , p_id                IN VARCHAR2 DEFAULT NULL
  , p_x1                IN VARCHAR2 DEFAULT NULL
  , p_y1                IN VARCHAR2 DEFAULT NULL
  , p_x2                IN VARCHAR2 DEFAULT NULL
  , p_y2                IN VARCHAR2 DEFAULT NULL
  , p_gradientunits     IN VARCHAR2 DEFAULT NULL
  , p_gradienttransform IN VARCHAR2 DEFAULT NULL
  , p_spreadmethod      IN VARCHAR2 DEFAULT NULL
  , p_xlinkhref         IN VARCHAR2 DEFAULT NULL
  , p_presentation      IN VARCHAR2 DEFAULT NULL
  , p_class             IN VARCHAR2 DEFAULT NULL
  , p_style             IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id                VARCHAR2(100);
    l_x1                VARCHAR2(100);
    l_y1                VARCHAR2(100);
    l_x2                VARCHAR2(100);
    l_y2                VARCHAR2(100);
    l_gradientunits     VARCHAR2(100);
    l_gradienttransform VARCHAR2(100);
    l_spreadmethod      VARCHAR2(100);
    l_xlinkhref         VARCHAR2(100);
    l_class             VARCHAR2(100);
    l_style             VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_x1 IS NOT NULL THEN
      l_x1 := ' x1="' || p_x1 || '"';
    END IF;
    IF p_y1 IS NOT NULL THEN
      l_y1 := ' y1="' || p_y1 || '"';
    END IF;
    IF p_x2 IS NOT NULL THEN
      l_x2 := ' x2="' || p_x2 || '"';
    END IF;
    IF p_y2 IS NOT NULL THEN
      l_y2 := ' y2="' || p_y2 || '"';
    END IF;
    IF p_gradientunits IS NOT NULL THEN
      l_gradientunits := ' gradientUnits="' || p_gradientunits || '"';
    END IF;
    IF p_gradienttransform IS NOT NULL THEN
      l_gradienttransform := ' gradientTransform="' || p_gradienttransform || '"';
    END IF;
    IF p_spreadmethod IS NOT NULL THEN
      l_spreadmethod := ' spreadMethod="' || p_spreadmethod || '"';
    END IF;
    IF p_xlinkhref IS NOT NULL THEN
      l_xlinkhref := ' xlink:href = "' || p_xlinkhref || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<linearGradient' || l_id || l_x1 || l_y1 || l_x2 || l_y2 || l_gradientunits || l_gradienttransform || l_spreadmethod || l_xlinkhref || p_presentation || l_class || l_style || '>' || p_stops || '</linearGradient>' || chr(13) || chr(10);
    
  END lineargradient_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The gradient stops.
  --
  -- Parameters:
  --   @p_offset       = "<number> | <percentage>"
  --   @p_stop_color   = "currentColor | <color> <icccolor> | inherit"
  --   @p_stop_opacity = "<opacity-value> | inherit"
  -- Returns:
  --   <stop /> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION stop_element (
    p_offset       IN VARCHAR2
  , p_stop_color   IN VARCHAR2
  , p_stop_opacity IN VARCHAR2
  )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN '<stop offset="' || p_offset || '" stop-color="' || p_stop_color || '" stop-opacity="' || p_stop_opacity || '" />';
  END stop_element;
  
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 21/11/2021
  -- Description: The radial gradients.
  --
  -- Parameters:
  --   @p_stops             = <stop> elements
  --   @p_id                = The unique name to an element
  --   @p_cx                = "<coordinate>"
  --   @p_cy                = "<coordinate>"
  --   @p_r                 = "<length>"
  --   @p_fx                = "<coordinate>"
  --   @p_fy                = "<coordinate>"
  --   @p_gradientunits     = "userSpaceOnUse | objectBoundingBox"
  --   @p_gradienttransform = "<transform-list>"
  --   @p_spreadmethod      = "pad | reflect | repeat"
  --   @p_xlinkhref         = "<iri>"
  --   @p_presentation      = The presentation attributes
  --   @p_class             = A class name or set of class names to an element
  --   @p_style             = The style information for the current element
  -- Returns:
  --   <radialGradient>...</radialGradient> element
  --
  -- Change History:
  --   21/11/21 Daniel Madeira: Initial release
  --   15/12/21 Daniel Madeira: NUMBER to VARCHAR2
  --   
  -- =================================================================================================
  FUNCTION radialgradient_element (
    p_stops             IN VARCHAR2
  , p_id                IN VARCHAR2 DEFAULT NULL
  , p_cx                IN VARCHAR2 DEFAULT NULL
  , p_cy                IN VARCHAR2 DEFAULT NULL
  , p_r                 IN VARCHAR2 DEFAULT NULL
  , p_fx                IN VARCHAR2 DEFAULT NULL
  , p_fy                IN VARCHAR2 DEFAULT NULL
  , p_gradientunits     IN VARCHAR2 DEFAULT NULL
  , p_gradienttransform IN VARCHAR2 DEFAULT NULL
  , p_spreadmethod      IN VARCHAR2 DEFAULT NULL
  , p_xlinkhref         IN VARCHAR2 DEFAULT NULL
  , p_presentation      IN VARCHAR2 DEFAULT NULL
  , p_class             IN VARCHAR2 DEFAULT NULL
  , p_style             IN VARCHAR2 DEFAULT NULL
  )
  RETURN VARCHAR2
  IS
    l_id                VARCHAR2(100);
    l_cx                VARCHAR2(100);
    l_cy                VARCHAR2(100);
    l_r                 VARCHAR2(100);
    l_fx                VARCHAR2(100);
    l_fy                VARCHAR2(100);
    l_gradientunits     VARCHAR2(100);
    l_gradienttransform VARCHAR2(100);
    l_spreadmethod      VARCHAR2(100);
    l_xlinkhref         VARCHAR2(100);
    l_class             VARCHAR2(100);
    l_style             VARCHAR2(100);
    
  BEGIN
    IF p_id IS NOT NULL THEN
      l_id := ' id="' || p_id || '"';
    END IF;
    IF p_cx IS NOT NULL THEN
      l_cx := ' cx="' || p_cx || '"';
    END IF;
    IF p_cy IS NOT NULL THEN
      l_cy := ' cy="' || p_cy || '"';
    END IF;
    IF p_r IS NOT NULL THEN
      l_r := ' r="' || p_r || '"';
    END IF;
    IF p_fx IS NOT NULL THEN
      l_fx := ' fx="' || p_fx || '"';
    END IF;
    IF p_fy IS NOT NULL THEN
      l_fy := ' fy="' || p_fy || '"';
    END IF;
    IF p_gradientunits IS NOT NULL THEN
      l_gradientunits := ' gradientUnits="' || p_gradientunits || '"';
    END IF;
    IF p_gradienttransform IS NOT NULL THEN
      l_gradienttransform := ' gradientTransform="' || p_gradienttransform || '"';
    END IF;
    IF p_spreadmethod IS NOT NULL THEN
      l_spreadmethod := ' spreadMethod="' || p_spreadmethod || '"';
    END IF;
    IF p_xlinkhref IS NOT NULL THEN
      l_xlinkhref := ' xlink:href = "' || p_xlinkhref || '"';
    END IF;
    IF p_class IS NOT NULL THEN
      l_class := ' class="' || p_class || '"';
    END IF;
    IF p_style IS NOT NULL THEN
      l_style := ' style="' || p_style || '"';
    END IF;
    
    RETURN '<radialGradient' || l_id || l_cx || l_cy || l_r || l_fx || l_fy || l_gradientunits || l_gradienttransform || l_spreadmethod || l_xlinkhref || p_presentation || l_class || l_style || '>' || p_stops || '</radialGradient>' || chr(13) || chr(10);
      
  END radialgradient_element;
  
END scalable_vector_graphics;
/

