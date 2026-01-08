= Find an application (e.g. games) that does not work with NAT. Please explain why.
  ต้องเข้าใจก่อนว่า NAT คืออะไร NAT (Network Address Translation) ทำหน้าที่
    + ซ่อน ip ภายใน local network
    + อนุญาติให้ connect เริ่มจากฝั่งด้านใน เท่านั้นห้ามเริ่ม connect จากฝั่งด้านนอก

  ขอยกตัวอย่าง application ที่ทำงานกับ NAT ไม่ได้คือ \
  P2P (Peer to Peer) ต้องมี 3 สิ่ง
  + ทั้ง 2 ฝั่งสามารถ connect หากันได้โดยอิสระ
  + แต่ละ peer ต้องรู้
    + ip
    + port
  + Network ต้องไม้ block package
  Nat ทำให้ 3 ข้อนี้ทำไม่ได้ดังนั้นข้าม NAT ทำ peer to peer กันไม่ได้ ตัวอย่าง application ที่ไม่ทำงานกับ NAT เลย

  ตัวอย่าง application นี้คือ Bitcoin\
  Bitcoin ไม่มี client-server ทุก node คือ peer และสิ่งที่ bitcoin ต้องการคือ \
  + public ip + port(8333)
  + peer สามารถ connect ได้หากันอยากอิสระ
  + Network topology ต้อง กระจายศูนย์

  สรุป NAT ทำให้ bitcoin จาก node เป็น client สามารถโหลด sync leager ได้อย่างเดียวทำให้ bitcoin node เป็น client

