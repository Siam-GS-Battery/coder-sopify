# คู่มือการใช้งาน Claude Code บน Coder (สำหรับผู้ใช้ครั้งแรก)

<!-- ponytail: integrated google doc guide -->
เวอร์ชัน: 1.0 · ผู้ดูแลเอกสาร: ทีม Dev / IT · อัปเดตล่าสุด: กรกฎาคม 2026

จบคู่มือนี้ คุณจะสามารถเปิด VS Code บนเว็บผ่าน Coder, ใช้งาน Claude Code และสั่งให้ Claude เขียนโค้ดตาม SOP ของทีม (sop skill) ได้ พร้อมบันทึกโค้ดขึ้น GitHub

---

## 1. ภาพรวมระบบ

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

> [!IMPORTANT]
> **สำคัญที่สุดของเล่มนี้: จุดพังมี 2 จุด**
> 1. ติดตั้ง/login Claude Code ผิด → ใช้งานไม่ได้เลย
> 2. ติดตั้ง SOP skill ผิดที่ → Claude ทำงานได้ แต่โค้ดไม่ตาม SOP และจะโดนตีกลับตอน IT Support
> 
> *เพราะฉะนั้น ห้ามข้ามขั้นตอน "ทดสอบ" ท้ายบทที่ 4 และ 5 เด็ดขาด*

---

## 2. สิ่งที่ต้องมีก่อนเริ่ม (Prerequisites)

ติ๊กให้ครบทุกข้อ ก่อนไปบทที่ 3 — ถ้าขาดข้อใด ให้ดำเนินการตามช่อง "ถ้ายังไม่มี" ก่อน

| สถานะ | สิ่งที่ต้องมี | ถ้ายังไม่มี |
| :---: | :--- | :--- |
| ☐ | บัญชี GitHub ที่ถูกเพิ่มเข้า Organization ของบริษัทแล้ว | แจ้ง IT ให้เชิญเข้า GitHub Organization |
| ☐ | สิทธิ์เข้าใช้ Coder (URL: `[ใส่ URL Coder ขององค์กร]`) | แจ้ง IT ขอเปิดบัญชี |
| ☐ | บัญชี Claude ขององค์กร (อีเมล + รหัสผ่านที่ IT แจ้ง) สำหรับ login Claude Code | แจ้ง IT ขอบัญชี/ที่นั่ง (seat) |
| ☐ | เบราว์เซอร์ Chrome หรือ Edge เวอร์ชันล่าสุด | อัปเดตเบราว์เซอร์ |

> [!TIP]
> **ทดสอบง่าย ๆ ว่าพร้อม:** เปิด github.com แล้ว login ได้ + เปิด URL ของ Coder แล้วเห็นหน้า login = ผ่าน 2 ข้อแรก

---

## 3. เข้าใช้ Coder ครั้งแรก

### 3.1 Login เข้า Coder
1. เปิดเบราว์เซอร์ ไปที่ `[URL Coder ขององค์กร]`
2. Login ด้วยบัญชีที่ IT ออกให้ (หรือปุ่ม *Sign in with GitHub* ถ้าองค์กรตั้งค่าไว้)

* **สำเร็จเมื่อ:** คุณจะเห็นหน้า Dashboard ของ Coder ที่มีเมนู Workspaces ด้านซ้าย

### 3.2 สร้าง Workspace
1. คลิก **Workspaces** → **Create Workspace**
2. เลือก Template ที่ทีมกำหนด: `[ชื่อ Template ขององค์กร เช่น dev-fullstack]`
3. ตั้งชื่อ Workspace เป็นชื่อของคุณ เช่น `dev-somchai`
4. คลิก **Create** แล้วรอสถานะเปลี่ยนเป็น **Running** (อาจใช้เวลา 1–3 นาที)

* **สำเร็จเมื่อ:** สถานะ Workspace เป็นวงกลมสีเขียว **Running** และมีปุ่ม/ไอคอน VS Code (Web) ปรากฏ

### 3.3 เปิด VS Code บนเว็บ
1. คลิกปุ่ม **Code-Server** ใน Workspace ของคุณ
2. VS Code จะเปิดในแท็บใหม่ของเบราว์เซอร์
3. เปิด Terminal: เมนู **Terminal** → **New Terminal** (หรือกด `Ctrl` + `` ` ``)

* **สำเร็จเมื่อ:** เห็น Terminal ด้านล่างจอ พิมพ์ `pwd` แล้ว Enter จะแสดง path เช่น `/home/coder`

*(หาก VS Code ไม่เปิด หรือ ค้าง: ดูข้อที่ 6 อาการ A)*

---

## 4. การติดตั้งเครื่องมือ (One-time Setup)

### 4.1 รันสคริปต์ติดตั้งอัตโนมัติ
รันคำสั่งด้านล่างนี้ใน Terminal ของ VS Code:
```bash
source <(curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh)
```

### 4.2 Login เข้า Claude Code
1. ครั้งแรกระบบจะถามวิธี login → เลือก login ด้วยบัญชี Claude (ไม่ใช่ API key)
2. ระบบจะแสดงลิงก์ URL ใน Terminal
3. คัดลอกลิงก์นั้นไปเปิดในแท็บเบราว์เซอร์ใหม่ (เนื่องจากอยู่บนเครื่อง cloud เบราว์เซอร์จะไม่เปิดเองอัตโนมัติ)
4. Login ด้วย **บัญชี Claude ขององค์กรที่ IT ออกให้** — ⚠️ *ห้ามใช้บัญชี Claude ส่วนตัว* เพราะจะไม่มีสิทธิ์ใช้งาน/ไม่ผูกกับองค์กร
5. เมื่อ login สำเร็จ หน้าเว็บจะแสดงรหัส (code) → คัดลอกกลับมาวางใน Terminal แล้ว Enter

---

## 5. การใช้งาน SOP Skills & Monitor Tool

### 5.1 การเรียกใช้งาน SOP Skills
หลังจากเปิด Claude Code ด้วยคำสั่ง `claude` คุณสามารถเรียกใช้งานทักษะมาตรฐานการทำงาน (SOP) ด้วยคำสั่ง:
```text
/sop
```

### 5.2 การใช้งาน Monitor Tool
เมื่อต้องการรันกระบวนการที่ใช้เวลานาน (เช่น การทดสอบ, การ build หรือการ deploy) หรือเฝ้าดู log ให้สั่งให้ Claude ใช้ **Monitor Tool** เพื่อติดตามผลการทำงานได้อย่างคุ้มค่าโทเค็นและไม่มีการดีเลย์จากการวนซ้ำ (polling):
* ตัวอย่างคำสั่ง: *"รัน test ทั้งหมดใน background และใช้ Monitor tool เฝ้าดูผลลัพธ์"*

---

## 6. การใช้งานประจำวัน

### 6.1 เปิดงาน
1. เข้า Coder → Workspace ของคุณ → ถ้าสถานะไม่เขียว กด **Start**
2. เปิด VS Code Web → เปิด Terminal
3. `cd` เข้าโฟลเดอร์โปรเจกต์ แล้วพิมพ์ `claude` (ปกติไม่ต้อง login ใหม่ ถ้าถาม login = ทำข้อ 4.2 ซ้ำ)

### 6.2 บันทึกงานขึ้น GitHub — ทำทุกวันก่อนเลิกงาน
⚠️ *โค้ดที่อยู่แต่ใน Workspace อาจหายได้หาก Workspace ถูก rebuild — GitHub คือที่เก็บถาวรเพียงที่เดียว*

```bash
git add .
git commit -m "comment"
git push
```
หรือสั่ง Claude Code ทำให้: พิมพ์ *"commit และ push งานทั้งหมดขึ้น GitHub"* — Claude จะขอยืนยันก่อนรันคำสั่งเสมอ

> [!WARNING]
> **ตาม SOP:** ทำงานบน feature branch (เช่น `feature/user-auth`) ไม่ push ตรงเข้า `main`

### 6.3 กติกาการทำงานกับ Claude Code ตาม SOP (ย่อ)
* ทำงานตามลำดับ phase: Requirements → Design → Database → TDD → Write Code ห้ามข้าม gate
* เขียน test ก่อนโค้ดจริง (TDD) เสมอ
* ก่อนส่งงาน: lint / type-check / test ต้องเขียวทั้งหมด, ไม่มี console.log, ไม่มี secret ในโค้ด
* รายละเอียดเต็มอยู่ใน skill (`~/.claude/skills/sop/`) — ถาม Claude ได้เลย เช่น *"Definition of Done ของทีมมีอะไรบ้าง"*

---

## 7. ภาคผนวก — คำสั่งที่ใช้บ่อย

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
