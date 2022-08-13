varying vec4 v_vColour;
varying vec3 v_vCoord;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vCoord.xy / v_vCoord.z );
}

