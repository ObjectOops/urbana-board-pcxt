import pathlib
import shlex
import subprocess
import time

BASE_PATH = pathlib.Path("scripts/conf")

xvlog_path_file = BASE_PATH / "xvlog_path.txt"
args_file = BASE_PATH / "xvlog_args.txt"
output_file = BASE_PATH / "xvlog_output.txt"

last_mtime = None

print("Started xvlog proxy")

while True:
    try:
        mtime = args_file.stat().st_mtime

        if last_mtime is None:
            last_mtime = mtime

        elif mtime != last_mtime:
            last_mtime = mtime

            try:
                xvlog_path = xvlog_path_file.read_text().strip()
            except FileNotFoundError:
                xvlog_path = "xvlog"
            
            args = [arg.replace("/workspaces/urbana-board-pcxt", str(pathlib.Path.cwd())) for arg in shlex.split(args_file.read_text())]
            
            print("Calling xvlog")

            result = subprocess.run(
                [xvlog_path, *args],
                capture_output=True,
                text=True,
            )

            output_file.write_text(result.stdout)
            
            print("Finished")

    except Exception as e:
        print(f"ERROR: {e}")

    time.sleep(1.0)
