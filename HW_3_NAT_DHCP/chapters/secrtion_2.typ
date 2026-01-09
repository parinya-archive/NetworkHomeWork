= What is DHCP Option 82 ? @dhcp-option82
  Ans: DHCP แบบเดิมคือ
  - Client $arrow.r$ DHCPDISCOVER
  - Server $arrow.r$ DHCPOFFER
  แต่ปัญหาคือ Server ไม่ทราบว่า Client ส่งมาจาก
  + port ไหน
  + swtich ตัวไหน
  + access ไหน
  Server ไม่รู้ว่า client อยู่จุดไหนเพราะ Client อาจใช้ DHCP เดียวกันหรือ Client อาจต่อ Switch ตัวเดียวกัน

  DHCP Option 82 จะมาช่วยแก้ปัญหาโดยการใส่ DHCP Package @dhcp-option82 ไม่ใช่ Client ใส่เอง ตัวที่ใส่ Option 82 คือ
  + DHCP Relay
  + Swtich
  + Access Device
  #figure(
    image("../images/option_82.png", width: 80%),
    caption: [option82]
  )
  นี่คือรูปหลังจากเพิ่ม Option 82 แล้วสังเกตว่ามี data เพิ่มขึ้นช่วยให้สามารถ identify ได้ว่าส่งมาจากใครแล้วก็เพิ่ม security ได้ด้วย @dhcp-option82
