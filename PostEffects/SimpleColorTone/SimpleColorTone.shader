// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/PostFX/SimpleColorTone"
{
    Properties
    {
        [HideInInspector]
        _MainTex ("Source", 2D) = "white" {}
        _Color ("Tone", Color) = (1,1,1,1)
        _Float ("Value", Range(0,1)) = 0

        _Luminance ("Luminance", Range(0,5)) = 0
    }
    SubShader
    {
        Cull Off
        ZWrite Off
        ZTest Always

        Pass {
            CGPROGRAM
            #pragma vertex vertexShader
            #pragma fragment fragmentShader

            #include "UnityCG.cginc"
            //i don't know what this stuff does
            struct vertexInput {
                float4 vertex : POSITION;
                float2 texcoord : TEXCOORD0;
            };

            struct vertexOutput {
                float2 texcoord : TEXCOORD0;
                float4 position : SV_POSITION;
            };

            vertexOutput vertexShader (vertexInput i) {
                vertexOutput o;
                o.position = UnityObjectToClipPos(i.vertex);
                o.texcoord = i.texcoord;
                return o;
            }

            sampler2D _MainTex; //Defining the variables
            float4 _Color;
            float _Float;

            float _Luminance;

            float4 fragmentShader (vertexOutput i) : COLOR {
                float4 color;
                half4 c = tex2D(_MainTex, i.texcoord); //"Capturing" the screen into a texture
                half lum = dot(c.rgb, fixed3(0.3, 0.59, 0.11)); //Luminance formula
                color.rgb = dot(_Color.rgb, c.rgb) * _Color * dot(lum, float3(_Luminance, _Luminance, _Luminance)); //Oh fuck, why
                color.a = _Color.a; //Just taking the alpha from _Color
                return float4(c.r + (color.r - c.r) * _Float, c.g + (color.g - c.g) * _Float, c.b + (color.b - c.b) * _Float, color.a); //Lerp function (i know, the function is implemented in Unity, but requires a newer version of shaders)
            }
            ENDCG
        }
    }
    FallBack Off
}
