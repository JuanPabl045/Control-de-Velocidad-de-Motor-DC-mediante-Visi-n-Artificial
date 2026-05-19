# MotorDc_Control — configuración rápida

Pasos para compilar y ejecutar en Windows:

1. Asegúrate de tener JDK 11+ (recomendado JDK 17) y Gradle instalado.
2. El proyecto ya contiene OpenCV en `opencv/build/java/opencv-480.jar` y las DLLs en `opencv/build/java/x64`.
3. Gradle descargará `jSerialComm:2.9.3` automáticamente.

Usa estos comandos desde la raíz del proyecto:

```bash
gradle wrapper
./gradlew run
```

Si no deseas usar Gradle, compila manualmente:

```bash
javac -cp ".;opencv/build/java/opencv-480.jar;jSerialComm-2.9.3.jar" ControlIntensidad.java
java -Djava.library.path="opencv/build/java/x64" -cp ".;opencv/build/java/opencv-480.jar;jSerialComm-2.9.3.jar" ControlIntensidad
```

Notas:
- Si obtienes `UnsatisfiedLinkError`, asegúrate de que `opencv_java480.dll` está en la ruta indicada.
- Si la cámara no se abre, prueba cambiar el índice en `new VideoCapture(1)` a `0`.

Preparar repo para push
-----------------------

Recomendación mínima antes de `git add` / `git commit`:

- Ejecuta `clean.bat` (Windows) o `clean.ps1` (PowerShell) para eliminar `.class` generados.
- Usa el `.gitignore` incluido (ya ignora `*.class`, `build/` y `opencv/sources/`).
- Si prefieres mantener `jSerialComm-2.9.3.jar` fuera del repo, muévelo a `lib/` y añade `lib/` a `.gitignore`.

Ejemplo de pasos para push:

```bash
git init
git add .
git commit -m "Initial project import"
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```

Ejecutar desde VS Code (F5)
--------------------------
Para ejecutar con F5 en VS Code:

- Asegúrate de tener la extensión "Debugger for Java" instalada.
- La configuración de lanzamiento está en `.vscode/launch.json` y compila con la tarea en `.vscode/tasks.json`.
- Pulsa F5; VS Code ejecutará la tarea de compilación y lanzará `ControlIntensidad` con `java.library.path` configurado.

Empujar a un repositorio remoto (git)
-----------------------------------
Instrucciones rápidas para subir este proyecto a un repo remoto:

1. Inicializar el repositorio (si aún no existe):

```bash
git init
git add .
git commit -m "Initial project import"
```

2. Añadir el remoto y subir (reemplaza `<your-repo-url>` por la URL real):

```bash
git remote add origin <your-repo-url>
git branch -M main
git push -u origin main
```

3. Nota sobre JARs y binarios: si prefieres no versionar `jSerialComm-2.9.3.jar`, muévelo a `lib/` y añade `lib/` en `.gitignore`. Si quieres incluirlo en el repo, no muevas el archivo.

Script útil para Windows (ejecuta en la raíz del proyecto):

```bat
@echo off
if "%1"=="" (
	echo Usage: push_to_remote.bat <git-remote-url>
	exit /b 1
)
git init
git add .
git commit -m "Initial project import"
git remote add origin %1
git branch -M main
git push -u origin main
```

Si quieres, puedo ejecutar los comandos `git` por ti; pásame la URL del repositorio remoto (por ejemplo `https://github.com/tuUsuario/tuRepo.git`) y confirmame que quieres que haga el push desde este equipo.
