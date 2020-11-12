#version 330 core									  
layout(location = 0) in vec3 aPos;   // λ�ñ���������λ��ֵΪ 0
layout(location = 1) in vec3 aNormal; // ������������λ��ֵΪ 1
layout(location = 2) in vec2 aTexCoord; // uv����������λ��ֵΪ 2
layout (location = 3) in mat4 instanceMatrix;//ʵ��������

//out vec4 vertexColor;
out vec2 TexCoord;


//��ɫ��ͷ���
out vec3 FragPos;
out vec3 Normal;



//uniform mat4 modelMat;

layout (std140) uniform Matrices
{
	mat4 viewMat;
	mat4 projMat;
 };


void main(){			

	   gl_Position =  projMat * viewMat * instanceMatrix * vec4(aPos.xyz,1.0);   
	   Normal =mat3(transpose(inverse(instanceMatrix)))*aNormal;
	   FragPos=(instanceMatrix * vec4(aPos.xyz,1.0)).xyz;
	   TexCoord=aTexCoord;



}