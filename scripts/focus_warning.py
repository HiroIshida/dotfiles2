#!/usr/bin/env python3
from pynput import keyboard
import threading
import numpy as np
import sounddevice as sd

TRIGGER_STRING = "twitter"
buffer = ""

def show_popup():
    fs = 44100  
    duration = 5.0
    frequency = 1000  
    t = np.linspace(0, duration, int(fs * duration), endpoint=False)
    signal = 0.5 * np.sin(2 * np.pi * frequency * t)
    sd.play(signal, fs)
    sd.wait()

def on_press(key):
    global buffer
    try:
        if hasattr(key, 'char') and key.char is not None:
            buffer += key.char
            if len(buffer) > len(TRIGGER_STRING):
                buffer = buffer[-len(TRIGGER_STRING):]

            if TRIGGER_STRING in buffer:
                threading.Thread(target=show_popup).start()
                buffer = ""
    except AttributeError:
        pass

with keyboard.Listener(on_press=on_press) as listener:
    listener.join()

