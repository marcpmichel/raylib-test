import std.stdio;
import raylib;

void main()
{
	InitWindow(720,640, "Raylib D");

	writeln("*** Monitor Name :", GetMonitorName(0));

	SetExitKey(KeyboardKey.KEY_ESCAPE);

	auto camera = Camera3D(
		Vector3(0, 10, 10),             // Camera position
		Vector3(0, 0, 0),               // Camera looking at point
		Vector3(0, 1, 0),               // Camera up vector (rotation towards target)
		45,            		        // Camera field-of-view Y
		CameraProjection.CAMERA_PERSPECTIVE);     // Camera mode type

	SetCameraMode(camera, CameraMode.CAMERA_ORBITAL);

	SetTargetFPS(60);

	while(!WindowShouldClose()) {
		if(IsKeyReleased(KeyboardKey.KEY_F)) {
			ToggleFullscreen();
		}
		UpdateCamera(&camera);
		BeginDrawing();
		ClearBackground(Colors.WHITE);
		BeginMode3D(camera);
		DrawGrid(10, 1);
                DrawCube(Vector3(0,0,0), 2, 2, 2, Colors.RED);
		EndMode3D();
		DrawText("Raylib !", 350, 10, 16, Colors.BLACK);
		DrawFPS(10,10);
		EndDrawing();
	}

	CloseWindow();
}
