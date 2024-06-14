sampler uImage : register(s0); // SpriteBatch.Draw �����ݻ��Զ��󶨵� s0
sampler uTransformImage : register(s1); // ���ڻ�ȡ��ɫ�ĵ�ɫ��
float uTime; // ʵ�ֵ�ɫ��Ĺ���Ч��

// �����ڸ���ɫ����ɫ
float4 TransformFunction(float2 coords : TEXCOORD0) : COLOR0
{
    float4 color = tex2D(uImage, coords);

	// any Ϊ false ��͸��ɫ�����ܸ�
    if (!any(color)) {
        return color;
    }
	
	// ���� uTextImage �����Լ� uTime ��ֵ��ȡ�ڵ�ɫ���ϵ����꣬ע��Ҫ %1.0 ��ȷ������ [0, 1) ������
    float2 barCoord = float2((coords.x + uTime) % 1.0, 0);
	
	// �ڵ�ɫ����ѡ����ɫ
    return tex2D(uTransformImage, barCoord) * color;
}

// ����ħЧ��ר�����õ�
float4 EnchantedFunction(float2 coords : TEXCOORD0) : COLOR0
{
    float4 color = tex2D(uImage, coords);

	// any Ϊ false ��͸��ɫ�����ܸ�
    if (!any(color))
    {
        return color;
    }
	
	// ���� uTextImage �����Լ� uTime ��ֵ��ȡ�ڵ�ɫ���ϵ����꣬ע��Ҫ %1.0 ��ȷ������ [0, 1) ������
    float2 barCoord = float2((coords.x * 0.2 - uTime * 0.5) % 1.0, (coords.y * 0.2 + uTime) % 1.0);
    if (barCoord.x < 0)
    {
        barCoord.x = 1 + barCoord.x;
    }
	
	// �ڵ�ɫ����ѡ����ɫ
    return tex2D(uTransformImage, barCoord) * 0.6 + color;
}

technique Technique1
{
	pass TransformPass
	{
        PixelShader = compile ps_2_0 TransformFunction();
    }
    pass EnchantedPass
    {
        PixelShader = compile ps_2_0 EnchantedFunction();
    }
}