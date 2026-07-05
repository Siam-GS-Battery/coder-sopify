# คู่มือการใช้งาน Claude Code บน Coder (สำหรับผู้ใช้ครั้งแรก)

<!-- ponytail: restructured guide without numbers and with git workflow under usage -->


จบคู่มือนี้ คุณจะสามารถเปิด VS Code บนเว็บผ่าน Coder, ใช้งาน Claude Code และสั่งให้ Claude เขียนโค้ดตาม SOP ของทีม (sop skill) ได้ พร้อมบันทึกโค้ดขึ้น GitHub

---

## ภาพรวมระบบ

```text
คุณ (เบราว์เซอร์)
       │
       ▼
Coder ─── สร้าง Workspace (เครื่อง dev บนคลาวด์)
       │
       ▼
VS Code บนเว็บ ─── เปิด Terminal ได้เหมือนเครื่องจริง
       │
       ▼
Claude Code ─── AI ช่วยเขียนโค้ดใน Terminal
       │
       ▼
SOP Skill ─── บังคับให้ Claude เขียนโค้ดตามมาตรฐานทีม (SDLC, React+TS, Node, PostgreSQL)
       │
       ▼
GitHub ─── บันทึกโค้ดทั้งหมด
```

| องค์ประกอบ | คืออะไร |
| :--- | :--- |
| **Coder** | แพลตฟอร์มสร้าง "เครื่องพัฒนา" (Workspace) บนคลาวด์ เปิดใช้ผ่านเบราว์เซอร์ |
| **VS Code บนเว็บ** | ตัวแก้ไขโค้ดที่รันอยู่ใน Workspace ของ Coder หน้าตาเหมือน VS Code ปกติ |
| **Claude Code** | เครื่องมือ AI แบบ command line ใช้สั่งงานเขียน/แก้โค้ดด้วยภาษาธรรมชาติ |
| **SOP Skill** | ชุดกติกาของทีม (มาตรฐาน SDLC ของ GS Battery) ที่ติดตั้งให้ Claude Code อ่านก่อนทำงาน |

---

## สิ่งที่ต้องมีก่อนเริ่ม (Prerequisites)

ตรวจสอบหัวข้อต่อไปนี้ ก่อนไปขั้นตอนถัดไป — ถ้าขาดข้อใด ให้ดำเนินการตามช่อง "ถ้ายังไม่มี" ก่อน

| สิ่งที่ต้องมี | ถ้ายังไม่มี |
| :--- | :--- |
| บัญชี GitHub ที่ถูกเพิ่มเข้า Organization ของบริษัทแล้ว | แจ้ง IT ให้เชิญเข้า GitHub Organization |
| สิทธิ์เข้าใช้ Coder (URL: `http://43.210.137.173:3000/`) | แจ้ง IT ขอเปิดบัญชี |
| บัญชี Claude ขององค์กร (อีเมล + รหัสผ่านที่ IT แจ้ง) สำหรับ login Claude Code | แจ้ง IT ขอบัญชี/ที่นั่ง (seat) |
| เบราว์เซอร์ Chrome หรือ Edge เวอร์ชันล่าสุด | อัปเดตเบราว์เซอร์ |

> [!TIP]
> **ทดสอบง่าย ๆ ว่าพร้อม:** เปิด github.com แล้ว login ได้ + เปิด URL ของ Coder แล้วเห็นหน้า login = ผ่าน 2 ข้อแรก

---

## เข้าใช้ Coder ครั้งแรก

### Login เข้า Coder
1. เปิดเบราว์เซอร์ ไปที่ `http://43.210.137.173:3000/`
2. Login ด้วยบัญชีที่ IT ออกให้ (หรือปุ่ม *Sign in with GitHub* ถ้าองค์กรตั้งค่าไว้)

* **สำเร็จเมื่อ:** คุณจะเห็นหน้า Dashboard ของ Coder ที่มีเมนู Workspaces ด้านซ้าย

### สร้าง Workspace
1. คลิก **Workspaces** → **Create Workspace**
2. เลือก Template ที่ทีมกำหนด: `Incus System Container with Docker`
3. ตั้งชื่อ Workspace เป็นชื่อของคุณ เช่น `dev-somchai`
4. คลิก **Create** แล้วรอสถานะเปลี่ยนเป็น **Running** (อาจใช้เวลา 1–3 นาที)

* **สำเร็จเมื่อ:** สถานะ Workspace เป็นวงกลมสีเขียว **Running** และมีปุ่ม/ไอคอน VS Code (Web) ปรากฏ

### เปิด VS Code บนเว็บ
1. คลิกปุ่ม **Code-Server** ใน Workspace ของคุณ
2. VS Code จะเปิดในแท็บใหม่ของเบราว์เซอร์
3. เปิด Terminal: เมนู **Terminal** → **New Terminal** (หรือกด `Ctrl` + `` ` ``)

* **สำเร็จเมื่อ:** เห็น Terminal ด้านล่างจอ พิมพ์ `pwd` แล้ว Enter จะแสดง path เช่น `/home/coder`

---

## การติดตั้งเครื่องมือ (One-time Setup)

### รันสคริปต์ติดตั้งอัตโนมัติ
รันคำสั่งด้านล่างนี้ใน Terminal ของ VS Code:
```bash
source <(curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh)
```

### Login เข้า Claude Code
1. ครั้งแรกระบบจะถามวิธี login → เลือก login ด้วยบัญชี Claude (ไม่ใช่ API key)
2. ระบบจะแสดงลิงก์ URL ใน Terminal
3. คัดลอกลิงก์นั้นไปเปิดในแท็บเบราว์เซอร์ใหม่ (เนื่องจากอยู่บนเครื่อง cloud เบราว์เซอร์จะไม่เปิดเองอัตโนมัติ)
4. Login ด้วย **บัญชี Claude ขององค์กรที่ IT ออกให้** — ⚠️ *ห้ามใช้บัญชี Claude ส่วนตัว* เพราะจะไม่มีสิทธิ์ใช้งาน/ไม่ผูกกับองค์กร
5. เมื่อ login สำเร็จ หน้าเว็บจะแสดงรหัส (code) → คัดลอกกลับมาวาง in Terminal แล้ว Enter

---

## การใช้งาน (Usage)

### การใช้งาน SOP Skills และ Monitor Tool
หลังจากเปิด Claude Code ด้วยคำสั่ง `claude` คุณสามารถเริ่มใช้งานเครื่องมือต่างๆ ได้ทันที:
* **SOP Skills:** พิมพ์คำสั่ง `/sop` เพื่อเริ่มใช้งานทักษะและกฎเกณฑ์มาตรฐานของทีม
* **Monitor Tool:** สั่งให้ Claude ใช้ **Monitor Tool** ในกรณีรันกระบวนการที่ใช้เวลานาน (เช่น การทดสอบ, การ build หรือการ deploy) หรือเฝ้าดู log เพื่อประหยัดโทเค็นและเฝ้าสังเกตการณ์ใน background (เช่น *"รัน test ทั้งหมดใน background และใช้ Monitor tool เฝ้าดูผลลัพธ์"*)


### การสร้าง Repository ใหม่ และการบันทึกงานขึ้น GitHub (Push)
คุณสามารถสั่งให้ Claude Code ดำเนินการสร้าง Repository หรือบันทึกงานขึ้น GitHub ได้ทันทีโดยใช้ภาษาธรรมชาติในห้องแชท:
* **ตัวอย่างการสร้าง Repository ใหม่:** พิมพ์บอก Claude ว่า *"สร้าง repository ใหม่บน GitHub ชื่อ [ชื่อโปรเจกต์] แบบ private และ push โค้ดในเครื่องขึ้นไป"*
* **ตัวอย่างการบันทึกงานประจำวัน (Push):** พิมพ์บอก Claude ว่า *"บันทึกงานและ push ขึ้น GitHub"* (Claude จะทำการจัดการรันคำสั่ง Git ที่จำเป็นทั้งหมดให้โดยอัตโนมัติหลังจากที่คุณกดยืนยัน)

---

## ภาคผนวก — คำสั่งที่ใช้บ่อย

| คำสั่ง | ทำอะไร |
| :--- | :--- |
| `claude` | เปิด Claude Code |
| `/exit` | ออกจาก Claude Code |
| `/login` / `/logout` | เข้า/ออกระบบบัญชี Claude |
| `claude --version` | เช็คเวอร์ชัน (ใช้ตรวจว่าติดตั้งแล้ว) |
| `claude doctor` | รายงานวินิจฉัยปัญหา (แนบให้ IT ได้) |
| `ls ~/.claude/skills/sop/SKILL.md` | เช็คว่า SOP skill อยู่ถูกที่ |

---

### เอกสารทางการ
* **Claude Code:** [docs.claude.com](https://docs.claude.com/en/docs/claude-code/overview)
* **Coder:** [coder.com/docs](https://coder.com/docs)

---
*หมายเหตุ: ช่องที่เป็น `[...]` ให้ทีม Dev/IT เติมค่าจริงขององค์กรก่อนแจกจ่าย: URL ของ Coder, ชื่อ Template, ชื่อ GitHub Organization และชื่อ repo ของ SOP skill*
