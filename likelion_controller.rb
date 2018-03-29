class LikelionController < ApplicationController

  require "open-uri" #http를 받아오는 것
  require "json" #install한 json 봄
  def index
  link = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
  doc = open(link) #doc이라는 변수 안에 html content를 박아 놓기
  lotto_info = doc.read #lotto_info 안에 json이 다 들어있음
  lotto_hash = JSON.parse(lotto_info) #parse : 제이슨 형태로 베껴온다. lotto info에서

  #전역변수를 만들어 주어야 함

  @mynumber = (1..45).to_a #View에서 쓰는 전역변수 / 1부터 45까지의 수를 array(배열 형태로 넣어준다.)
  @mylotto = @mynumber.sample(6) #mynumber에서 sample 6개를 뽑아준다.

  @lotto = lotto_hash
  @bouns_num = lotto_hash["firstPrzwnerCo"] #value(값)인 10이 들어가 있음

  @temp = Array.new #Array를 만들어서 temp에 저장
  counter = 1

    while(counter <= 6)
      @temp.push(lotto_hash["drwtNo#{counter}"]) # #의미 %c , +(java)
      counter += 1 # ++ 안 먹힘
    end
    puts @temp #서버 창(콘솔)에 로그(어떤 사람이 접근했다.) 찍히게 하기
    @whatisit = @mylotto & @temp # 숫자 2개가 배열로 저장이 됨, 일치하는 것 찾아줌
  end
end
