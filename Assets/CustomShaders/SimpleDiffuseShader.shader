Shader "Custom/SimpleDiffuseShader" // path
{
	Properties // fields serialized to Inspector
	{
		_Color("Color", Color) = (1,0,0,1) // serialize color tint on material with RGBA default
		_MainTex("Albedo (RGB)", 2D) = "white" {} // texture to use and base color, 'white' for none
	}
	SubShader
	{
		Tags { "RenderType" = "Opaque" }

		CGPROGRAM
		#pragma surface surf Lambert
		#pragma target 3.0

		sampler2D _MainTex; // texture declaration

		struct Input {
			float2 uv_MainTex; // uv values of texture (offset I think)
		};

		float4 _Color; // color declaration

		void surf(Input IN, inout SurfaceOutput o) 
		{
			float4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color; // merge texture tiwth color tint
			o.Albedo = c.rgb; // set object albedo to color's rgb
			o.Alpha = c.a; // set object alpha to color's alpha
		}
		ENDCG
	}
	FallBack "Diffuse"
}
