#version 330 core
layout(location = 0) in vec3 aPos;   // λ�ñ���������λ��ֵΪ 0
layout(location = 1) in vec3 aNormal; // ������������λ��ֵΪ 1
layout(location = 2) in vec2 aTexCoord; // uv����������λ��ֵΪ 2
out VS_OUT {
    vec3 normal;
} vs_out;

uniform mat4 modelMat;
layout (std140) uniform Matrices
{
	mat4 viewMat;
	mat4 projMat;
 };


void main()
{
    gl_Position = vec4(aPos, 1.0); 
    mat3 normalMatrix = mat3(transpose(inverse(viewMat * modelMat)));
    vs_out.normal = aNormal;
	
}