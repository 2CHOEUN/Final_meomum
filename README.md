# MEOMUM 프로젝트
> 머뭄은 사용자가 원하는 방향에 따라 <strong>공간을 컨설턴트</strong> 해주며,<br>가구를 <strong>사지 않고 렌탈</strong>하여 부담없이 나만의 공간을 채워나가는 고객 맞춤형 서비스를 제공합니다.

- 진행기간 : 23.03.15 ~ 23.04.16

- <a href="https://github.com/Subeen-Jang/meomum">프로젝트 전체 내용 확인하기</a>


- 담당기능
  - 회원가입
  - 로그인
  - 간단문의견적
  - 나의 정보수정
  - 관리자 : 회원, 관리자 관리 / 전체스케줄/ 
  
  
- 수정 내용
  - 비밀번호 암호화하여 저장
  
  
  <hr />
### 👁‍🗨 담당기능 자세한 내용 보기 (내용을 펼치면 이미지가 보입니다.)

<!------------------------->

<details>
  <summary><span style="color:red">  메인페이지(헤더,푸터) </span></summary>

<br>

<div>

![main](https://user-images.githubusercontent.com/121777500/236467836-9b0620ae-70db-413a-9b9f-e5c512ad126a.gif)

![캡처](https://user-images.githubusercontent.com/121777500/236464445-6a651646-2ab2-427b-8a3c-281f5cfef9ff.PNG)


 - 로그인시 회원 이름 표시와 장바구니에 담겨있는 상품 개수를 확인할 수 있습니다.
 - 사이트에 대한 전반적인 소개가 담겨있습니다.
 - 회사에 대한 간략한 정보가 담겨있습니다.
</div>

</details>

<!------------------------->

<details>
    <summary><span style="color:red">  회원가입 </span></summary>

  <br>

  <div>
  
  ![회원가입](https://user-images.githubusercontent.com/121777500/236476939-bd576945-b1d3-4540-8a06-1f2eef695571.gif)
![이메일인증](https://user-images.githubusercontent.com/121777500/236477860-21e8132e-6c2f-4b6a-a4aa-523cd0bc8e32.PNG)


   - 이메일 중복 확인 후 인증번호가 발송됩니다.
   - 이메일로 전송된 인증번호와 입력된 인증번호가 일치해야 회원가입을 할 수 있습니다.
   - 회원가입 정보로 이메일, 비밀번호, 이름, 주소, 휴대폰 번호를 입력해야하며 필수약관동의를 해야합니다. 
   
  </div>

</details>

<!------------------------->

<details>
    <summary><span style="color:red">  로그인 </span></summary>

  <br>
  
  <div>
    
  ![카카오로그인](https://github.com/2CHOEUN/Final_meomum/assets/121777500/aae19d20-1ede-4ca0-b977-590f52543991)

   - 아이디 기억하기 버튼을 통해 아이디를 자동으로 입력해 놓을 수 있습니다.
   - 아이디를 잊었을 경우 아이디 찾기를 통해 이름과 휴대폰으로 아이디를 찾을 수 있습니다.
   - 비밀번호를 잊었을 경우 비밀번호 찾기를 통해 아이디, 이름과 휴대폰으로 정보를 찾고 등록된 이메일로 임시 비밀번호를 발급합니다.
   - 카카오 로그인을 할 수 있습니다.
      - 카카오 계정에 등록된 이메일과 동일한 아이디(이메일)이 있을 경우 바로 로그인되며 등록된 이메일이 없을 경우
        별도 이메일 인증 없이 카카오 계정 이메일로 자동 인증되며 추가 정보 입력 후 회원가입을 할 수 있습니다.
   
  </div>

</details>

 <!------------------------->

<details>
    <summary><span style="color:red"> 회원정보 수정 </span></summary>

  <br>

  <div>
    
 ![비밀번호변경](https://github.com/2CHOEUN/Final_meomum/assets/121777500/1a941ca4-6486-48ab-9ca1-e9088f2f5c53)
![회원정보수정](https://github.com/2CHOEUN/Final_meomum/assets/121777500/15635d61-188e-4616-88da-f62e0903a8d5)
![회원탈퇴](https://github.com/2CHOEUN/Final_meomum/assets/121777500/d1bea042-5469-44ae-9269-1ca1768b0800)
    
    - 진입을 위해선 비밀번호를 한번 더 입력 후 수정페이지로 이동할 수 있습니다.
    - 이메일을 제외한 이름, 주소, 연락처를 수정할 수 있습니다.
    - 별도의 모달창으로 비밀번호를 변경 할 수 있습니다.
    - 진행중인 서비스가 있을경우 탈퇴가 되지 않으며, 회원탈퇴시 서비스 내역이 함께 삭제됩니다.
      그러나 후기나 간단문의 게시글은 삭제되지 않습니다.
    
  </div>
  
</details>

 <!------------------------->

<details>
    <summary><span style="color:red"> 나의 포인트 내역 </span></summary>

  <br>

  <div>
   
![나의포인트](https://github.com/2CHOEUN/Final_meomum/assets/121777500/c213d4bf-2fd6-4139-9ed8-aed3730dfcbd)

    - 회원가입시 기본으로 5000포인트가 지급됩니다.
    - 사용내역은 최신사용내역부터 내림차순으로 표시됩니다.
    - 사용된 포인트는 "-"로 표시되고, 적립된 포인트는 "+"로 표시됩니다.
    - 페이징 처리를 통해 포인트 내역을 한 번에 10개씩 볼 수 있습니다.
    
  </div>
  
</details>

<!------------------------->

<details>
    <summary><span style="color:red"> 간단문의내역 </span></summary>

  <br>

  <div>
    
![간단문의글 작성](https://github.com/2CHOEUN/Final_meomum/assets/121777500/62d0625b-0aa3-46ec-9682-b83303552184)
![간단문의리스트](https://github.com/2CHOEUN/Final_meomum/assets/121777500/9f337c3d-f27f-40ee-9e39-3e0b4152604c)

    (회원)
    - 비회원도 게시글을 작성할 수 있습니다. 
      좌측 상단에는 전체 게시글 수를 확인할 수 있으며, 검색 기능을 통해 내용, 제목, 작성자 중 해당 검색어가 포함된 게시글을 찾을 수 있습니다.
    - 작성자의 개인정보 보호를 위해 가운데 "*"로 가렸으며, 당일 작성된 글은 "new" 표시와 작성 시간이 함께 표시됩니다. 
      진행 상태는 답변이 달렸을 경우 "답변 완료"로 표시되고, 답변이 아직 달리지 않았을 경우 "진행 중"으로 표시됩니다.
    - 게시글에는 이미지 첨부가 가능하며, 본문 내용을 확인할 때 첨부된 파일이 있다면 "첨부 파일 보기"를 클릭하여 모달 창에서 해당 이미지를 볼 수 있으며, 
      다운로드도 가능합니다.
    
    (관리자)
    - 답변 미완료된 글이나 당일 작성된 글만 선택하여 볼 수 있으며, 검색 기능을 통해 제목, 작성자, 내용을 통합적으로 검색하여 해당 게시글을 찾을 수 있습니다. 
      또한, 사용자가 등록한 첨부파일도 확인하고 다운로드할 수 있습니다.
    - 관리자 페이지에서는 사용자 페이지에서 익명으로 보였던 작성자 정보가 모두 표시됩니다.
    - 게시글에 답글을 작성하면 진행 상태가 "답변 완료"로 표시되며, 게시글을 삭제할 경우 답변 글도 함께 삭제됩니다.

  </div>
  
</details>

<!------------------------->

<details>
    <summary><span style="color:red"> 전체 스케줄 확인 </span></summary>

  <br>


  <div>
   
![전체스케줄](https://github.com/2CHOEUN/Final_meomum/assets/121777500/fc0d916a-311d-45db-8d10-a2fcb018fd92)

  - 방문 견적 예약과 서비스 진행 내역을 확인할 수 있습니다. 이를 시간별로 다른 색상으로 표시하여 파악하기 쉽도록 구성하였습니다.
  - 상단에는 해당 월에 예약된 방문 견적 예약 건수, 서비스 진행 건수, 예약 취소 건수를 확인할 수 있습니다. 해당 내역을 클릭하면 상세 예약 내역을 확인할 수 있습니다.


  </div>
  
</details>

