Shader "Custom/CircleClip"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Radius ("Radius", Range(0.01, 0.25)) = 0.25
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Lambert alpha

        sampler2D _MainTex;
        float _Radius;
        float4 _Color;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            float2 uv = IN.uv_MainTex;
            float2 diff = uv - float2(0.5, 0.5);
            float val = diff.x * diff.x + diff.y * diff.y;

            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, uv) * _Color;

            o.Albedo = c.rgb;
            if (val > _Radius) {
                o.Alpha = 0;
            } else {
                o.Alpha = c.a;
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
