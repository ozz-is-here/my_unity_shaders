# my_unity_shaders

## 🇺🇸 What is this repository for?

This is a collection of my own Unity shaders, as the name says. I put here the shaders i made for Unity.

## How to use post effects (for newbies)

Create a script. Add this function into it:

```
void OnRenderImage(RenderTexture src, RenderTexture dest) {
  Graphics.Blit(src, dest, material);
}
```

The variable `material` is the material using a shader with post effect. Attach the script to the main camera. 

[More about OnRenderImage](https://docs.unity3d.com/ScriptReference/Camera.OnRenderImage.html)

## 🇷🇺 Для чего нужен этот репозиторий?

Это - коллекция моих собственных шейдеров, как написано в названии. Здесь я складываю все шейдеры для Unity, которые сделал.

## Как использовать постэффекты (для новичков)

Создайте скрипт. Добавьте в него эту функцию:

```
void OnRenderImage(RenderTexture src, RenderTexture dest) {
  Graphics.Blit(src, dest, material);
}
```

Переменная `material` - это материал, использующий шейдер с постэффектом. Повесьте скрипт на главную камеру.

[Больше про OnRenderImage](https://docs.unity3d.com/ScriptReference/Camera.OnRenderImage.html)
