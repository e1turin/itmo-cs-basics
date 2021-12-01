#!/bin/bash


init_game(){
  M=(""  "#" "#" "#" "#" "#"
     "#" "#" "#" "#" "#" "#"
     "#" "#" "#" "#" "#" "#"
     "#" "#" "#" "#" "#" "#"
     "#" "#" "#" "#" "#" "#"
     "#" "#" "#" "#" "#" "#"
    )

  HERO=0
  drow_field
}

go_to_end(){
  printf "\e[14B"
}

drow_field(){
  clear

  D="-------------------------"
  F="%s\n|%3s|%3s|%3s|%3s|%3s|%3s|\n"
  printf $F $D ${M[0]:-"."} ${M[1]:-"."} ${M[2]:-"."} ${M[3]:-"."} ${M[4]:-"."} ${M[5]:-"."}
  printf $F $D ${M[6]:-"."} ${M[7]:-"."} ${M[8]:-"."} ${M[9]:-"."} ${M[10]:-"."} ${M[11]:-"."}
  printf $F $D ${M[12]:-"."} ${M[13]:-"."} ${M[14]:-"."} ${M[15]:-"."} ${M[16]:-"."} ${M[17]:-"."}
  printf $F $D ${M[18]:-"."} ${M[19]:-"."} ${M[20]:-"."} ${M[21]:-"."} ${M[22]:-"."} ${M[23]:-"."}
  printf $F $D ${M[24]:-"."} ${M[25]:-"."} ${M[26]:-"."} ${M[27]:-"."} ${M[28]:-"."} ${M[29]:-"."}
  printf $F $D ${M[30]:-"."} ${M[31]:-"."} ${M[32]:-"."} ${M[33]:-"."} ${M[34]:-"."} ${M[35]:-"."}
  echo $D
  printf "\e[14A"
}

exchange(){
  M[$HERO]=${M[$1]}
  M[$1]=""
  HERO=$1
}


quit_game(){
  while :
  do
    read -n 1 -s -p "Do you really want to quit [y/n]?"
    case $REPLY in
      y|Y) exit
      ;;
      n|N) return
      ;;
    esac
  done
}

check_win(){
  case $HERO in
    35)
      go_to_end
      echo ""
      echo "YOU WON! WANT TO PLAY AGAIN [y/n]?"
      echo ""
        while :
        do
          read -n 1 -s
          case $REPLY in
          y|Y)
            init_game
            break
          ;;
            n|N) exit
          ;;
          esac
        done
    ;;
    *) return
    ;;
  esac
}

start_game(){
  while :
  do
    echo "Use w,a,s,d to move, q for quit"
    read -n 1 -s
    case $REPLY in
      j|s)
        [ $HERO -lt 30 ] && exchange $(( $HERO + 6 ))
      ;;
      l|d)
        COL=$(( $HERO % 6 ))
        [ $COL -lt 5 ] && exchange $(( $HERO + 1 ))
      ;;
      k|w)
        [ $HERO -gt 5 ] && exchange $(( $HERO - 6 ))
      ;;
      h|a)
        COL=$(( $HERO % 6 ))
        [ $COL -gt 0 ] && exchange $(( $HERO - 1 ))
      ;;
      q)
        quit_game
      ;;
    esac
    drow_field
    check_win
  done
}

init_game
start_game
