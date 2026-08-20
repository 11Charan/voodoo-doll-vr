# 🪆 Voodoo Doll VR

### A miniature-proxy interaction technique for Virtual Reality

Voodoo Doll VR is an experimental **VR interaction system built with Godot 4 and OpenXR**.

The project explores an alternative way of interacting with full-size objects in virtual environments. Instead of directly manipulating a distant object, the user selects it and receives a **miniature representation** in their hand.

Changes made through the miniature are immediately reflected on the original object, allowing interaction at a more comfortable scale.

## 🎥 Demo

> Demo GIF/video coming soon.

## ✨ Features

* 🎯 Ray-based object selection
* 🪆 Miniature proxy generation
* 📏 Real-time object resizing
* 🎨 Interactive color switching
* 🔄 Immediate synchronization between miniature and original object
* 🥽 OpenXR controller input
* 🔦 Visual pointer feedback
* 🎮 Multiple interactable 3D objects

## 🎮 Interaction

The interaction is split between both VR controllers.

| Input             | Action                         |
| ----------------- | ------------------------------ |
| **Right Trigger** | Select an object               |
| **Right Primary** | Increase/decrease object size  |
| **Left Trigger**  | Cycle through available colors |
| **Left Primary**  | Finish the current selection   |

Size and color changes are applied simultaneously to the miniature representation and the original object.

## 🧠 How It Works

### 1. Select

The user points the right controller at an interactable object and presses the trigger.

### 2. Create Miniature

A miniature representation of the selected object is created and presented within the user's interaction space.

### 3. Modify

The user can modify properties of the selected object through the VR controllers.

The right controller handles resizing while the left controller handles color changes.

### 4. Synchronize

Changes made through the miniature representation are immediately applied to the corresponding full-size object.

### 5. Finish

The interaction can be completed using the left controller, returning the system to its selection state.

## 🏗️ Architecture

The interaction system is implemented in **GDScript** using native Godot nodes.

```text
VR / OpenXR
     │
     ├── RightHand.gd
     │     ├── Object Selection
     │     └── Object Resizing
     │
     ├── LeftHand.gd
     │     ├── Color Switching
     │     └── Finish Selection
     │
     ├── Pointer.gd
     │     └── Ray Interaction
     │
     └── ObjectManager.gd
           ├── Miniature Management
           └── Live Object Updates
```

No custom C++ modules or external interaction frameworks are required for the core interaction system.

## 🛠️ Tech Stack

* **Godot 4.6.3**
* **GDScript**
* **OpenXR**
* **Godot OpenXR Vendors Plugin**
* **RayCast3D**
* **3D Physics & Collision Detection**

## 📁 Project Structure

```text
voodoo-doll-vr/
│
├── Assets/
│   ├── Models/
│   └── Textures/
│
├── Scripts/
│   ├── HelpText.gd
│   ├── LeftHand.gd
│   ├── ObjectManager.gd
│   ├── Pointer.gd
│   ├── RightHand.gd
│   └── VRSetup.gd
│
├── openxr_action_map.tres
├── project.godot
├── root.tscn
└── README.md
```

## ⚙️ Requirements

* Godot **4.6.3**
* Godot OpenXR Vendors plugin **5.0 or newer**
* OpenXR-compatible VR headset and runtime

## 🚀 Running the Project

1. Clone this repository.

```bash
git clone https://github.com/11Charan/voodoo-doll-vr.git
```

2. Open **Godot 4.6.3**.

3. Import the repository's `project.godot`.

4. Make sure the required OpenXR runtime and Godot OpenXR Vendors plugin are available.

5. Connect an OpenXR-compatible VR headset.

6. Run the project from Godot.

## 💡 Technical Challenges

Development involved solving several VR-specific problems, including:

* Reliable controller tracking
* Ray-based object detection
* Correct miniature scaling
* Synchronizing properties between miniature and original objects
* Managing duplicated nodes
* Scene-tree parenting
* Collision detection
* OpenXR controller input handling

## 📚 Research

The interaction concept is inspired by research into **Voodoo Doll interaction techniques** for manipulating virtual objects across different scales:

* J. S. Pierce, B. C. Stearns and R. Pausch, *Voodoo Dolls: Seamless Interaction at Multiple Scales in Virtual Environments*, SI3D, 1999.
* J. S. Pierce and R. Pausch, *Comparing Voodoo Dolls and HOMER: Exploring the Importance of Feedback in Virtual Environments*, 2002.

## 🙏 Asset Credits

The environment uses third-party assets from **Poly Haven** and **Sketchfab**.

Poly Haven assets used in the project are available under **CC0**.

Individual Sketchfab assets remain the work of their respective creators and are used under **Creative Commons Attribution 4.0 (CC BY 4.0)**. Appropriate attribution should be retained when redistributing these assets.

The original licensed background music is **not distributed with this repository**.

## 🚀 Future Improvements

Potential extensions include:

* Haptic feedback
* Physics-based interaction
* Object snapping
* Additional object properties
* Improved interaction feedback
* Multiplayer support

---

**Godot • OpenXR • GDScript • Virtual Reality • XR Interaction**
