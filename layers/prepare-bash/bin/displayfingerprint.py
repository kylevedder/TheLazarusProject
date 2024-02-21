#!/usr/bin/env python3
import subprocess
import json
import argparse
from pathlib import Path
from typing import Optional, Dict


def get_monitor_info() -> Dict[str, Dict[str, str]]:
    result = subprocess.run(["xrandr", "--query"], stdout=subprocess.PIPE, text=True)
    lines = result.stdout.split("\n")

    monitors: Dict[str, Dict[str, str]] = {}
    for line in lines:
        if "connected" in line:
            parts = line.split()
            name = parts[0]
            state = parts[1]
            if state == "connected":
                resolution = parts[2].split("+")[0]
                orientation = parts[3] if len(parts) > 3 else "normal"
                human_readable_name = f"Monitor {len(monitors) + 1}"
                monitors[human_readable_name] = {
                    "Name": name,
                    "Resolution": resolution,
                    "Orientation": orientation,
                }
    return monitors


def save_monitor_info(filename, monitor_info):
    filename = Path(filename)
    filename.parent.mkdir(parents=True, exist_ok=True)
    print(f"Saving monitor info to {filename}")
    with open(filename, "w") as file:
        json.dump(monitor_info, file, indent=4)


if __name__ == "__main__":
    # Setup argparse to accept a semantic name for the configuration
    parser = argparse.ArgumentParser(description="Fingerprint your monitor setup.")
    parser.add_argument(
        "config_name",
        type=str,
        help="A semantic name for the current monitor configuration.",
    )
    args = parser.parse_args()

    monitor_info = get_monitor_info()
    print(monitor_info)  # Print the monitor info for verification

    # Use the semantic name provided by the user for the filename
    filename = (
        Path("~/.screenlayout/monitor_fingerprints").expanduser().absolute()
        / f"{args.config_name}.json"
    )
    save_monitor_info(filename, monitor_info)
