#! /bin/bash


Error(){
	whiptail --msgbox "Valeur incorrect" --title "Error" 10 70
}

   #SI L'UTILISATEUR VAUT FAIRE UNE AUTRE OPERATION OU SORTIR	
  Repeter(){
    choix=$(whiptail --inputbox "Vous voulez faire une autre operation entrer 1 si oui 0 si non  " 10 70 --title "Repeter" 3>&1 1>&2 2>&3)


        
  boucleInt=1

  while [ $boucleInt -eq 1 ]; do
 if [ $choix -eq 1 ]; then
            boucle=1
            boucleInt=0
    elif [ $choix -eq 0 ]; then
            boucle=0
            boucleInt=0
    else
    whiptail --msgbox --title "ERROR " "Merci d'entrer un choix dans la liste" --fb 10 70
       
       Repeter
    fi
   done

  }

  sel=$(whiptail --title "Calculatrice" --fb --menu "Bienvenue :" 15 60 4 \
        "1" "Commencer" \
        "2" "A propos de notre calculatrice" \
        "3" "A propos de nous" 3>&1 1>&2 2>&3)


   case $sel in
	  

	   1)

      boucle=1
           while [ $boucle -eq 1 ]; do

 message=$(whiptail --title "Operation de base" --fb --menu "Choix d'operations:" 20 60 7 \
                                "1" "Operations de base" \
                                "2" "Operations avancee" \
                                "3" "Conversion numerique" \
			        "4" "Quitter"	3>&1 1>&2 2>&3)

    case $message in
	    1)
message1=$(whiptail --title "Operation de base" --fb --menu "Choix d'operations: " 20 60 6 \
    "1" "Addition" \
    "2" "Soustraction" \
    "3" "Multiplication" \
    "4" "Division" \
    "5" "Modulo" \
    "6" "Quitter"  3>&1 1>&2 2>&3)

   case $message1 in
	   1)

      
bcl=1
while [[ $bcl -eq 1 ]]; do

     
	op1=$(whiptail --inputbox "Addition " 10 70 --title "Entrer l'ensemble des operandes : " 3>&1 1>&2 2>&3)

 #FONCTON QUI CALCULE LA SOMME
	addition(){

          s=0

        for i in $* ; do
     
	#SI L'UTILISATEUR ENTRE UN CARACTERE C'EST ERROR IL FAUT REENTRER LES OPERANDES
    if [[ "$i" =~ [a-z] ]] ;then
	    Error
	    bcl=1
	    return

       #CALCULE DE LA SOMME DES OPERANDES

    else
              op=$i
              shift
             s=$(echo $s + $i | bc -l)
	   
    fi
done

  whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$s" --fb 10 70
  bcl=0

  #DONNER LE CHOIX A L'UTILISATEUR S'IL VAUT FAIRE UNE AUTRE OPERATION OU SORTIR

  Repeter

}

 #APPEL DE LA FONCTION

 addition $op1
 
done
    ;;


2) 
	bcl=1
while [[ $bcl -eq 1 ]]; do

        op1=$(whiptail --inputbox "Soustraction " 10 70 --title "Entrer l'ensemble des operandes : " 3>&1 1>&2 2>&3)


	#FONCTON QUI CALCULE LA SOUSTRACTION
        soustraction(){

          s=0
	  nbr=$#

          
        for i in $* ; do
        
	
        #SI L'UTILISATEUR ENTRE UN CARACTERE C'EST ERROR IL FAUT REENTRER LES OPERANDES
    if [[ "$i" =~ [a-z] ]];then
            Error
            bcl=1
            return

       #CALCULE DE LA SOUSTRACTION DES OPERANDES

    else
	    if [[ $nbr = $# ]];then
	      s=$i
	      shift
             
	    else
		     op=$i
		     shift
              s=$(echo $s - $op | bc -l)
              bcl=1
	    fi
 fi
   
     done

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$s" --fb 10 70
   bcl=0
  Repeter


}

 #APPEL DE LA FONCTION

   soustraction $op1
done
	;;

   3)
  
  
bcl=1
s=1



while [[ $bcl -eq 1 ]]; do


        op=$(whiptail --inputbox "Multiplication " 10 70 --title "Entrer l'ensemble des operandes : " 3>&1 1>&2 2>&3)

   
	#FONCTON QUI CALCULE LA MULTIPLICATION
        multiplication(){

          s=1

        for i in $* ; do

        #SI L'UTILISATEUR ENTRE UN CARACTERE C'EST ERROR IL FAUT REENTRER LES OPERANDES
    if [[ "$i" =~ [a-z] ]];then
            Error
            bcl=1
            return

       #CALCULE DE LA MULTIPLICATION DES OPERANDES

    else
              op1=$i
              shift
             s=$(echo "$s * $op1" | bc -l)

    fi
done

 whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$s" --fb 10 70
   bcl=0
  Repeter

}

   #APPEL DE LA FONCTION  
     multiplication $op
done

  
   ;;

   4)
  
 bcl=1
while [[ $bcl -eq 1 ]]; do

        
s=1
cmp=1




	op1=$(whiptail --inputbox "Division " 10 70 --title "Entrer l'ensemble des operandes : " 3>&1 1>&2 2>&3)


     devision(){

          s=0
          nbr=$#


        for i in $* ; do


        #SI L'UTILISATEUR ENTRE UN CARACTERE C'EST ERROR IL FAUT REENTRER LES OPERANDES
    if [[ "$i" =~ [a-z] ]];then
            Error
            bcl=1
            return

       #CALCULE DE LA DEVISION DES OPERANDES

    else
            if [[ $nbr = $# ]];then
              s=$i
              shift

            else
		if [[ $i -eq 0 ]]; then
	whiptail --msgbox --title "Error " "Error devision par 0 " --fb 10 70
	          bcl=1
		  return
		else
                     op=$i
		     shift
              s=$(echo $s / $op | bc -l)
              bcl=1
	       fi
            fi
 fi

     done

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$s" --fb 10 70
   bcl=0
  Repeter


}

  #APPEL DE LA FONCTION

   devision $op1



done



      
 
   ;;


    5)
    bcl=1

    while [[ $bcl -eq 1 ]];do
  op1=$(whiptail --inputbox "Modulo " 10 70 --title "Entrer l'ensemble des operandes : " 3>&1 1>&2 2>&3)

   modulo(){

          s=0
          nbr=$#


        for i in $* ; do


        #SI L'UTILISATEUR ENTRE UN CARACTERE C'EST ERROR IL FAUT REENTRER LES OPERANDES
    if [[ "$i" =~ [a-z] ]];then
            Error
            bcl=1
            return

       #CALCULE DE LE MODULO DES OPERANDES

    else
            if [[ $nbr = $# ]];then
               s=$i
               shift

            else
		    if [[ $i -eq 0 ]]; then
        whiptail --msgbox --title "Error " "Error Modulo 0 " --fb 10 70
                  bcl=1
                  return
            else

                     op=$i
                     shift
              s=$(echo $s % $op | bc -l)
              bcl=1
            fi
	  fi
 fi

     done

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$s" --fb 10 70
   bcl=0
  Repeter


}

  #APPEL DE LA FONCTION

   modulo $op1

  done
 
  

      ;;

6)
  
	whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
	boucle=0

	;;
   
*)
	Repeter 
	;;

  esac


    ;;

2)
   



  message2=$(whiptail --title "Operation" --fb --menu "Choix d'operations: " 20 60 8 \
    "1" "Factorielle" \
    "2" "Puissance" \
    "3" "Logarithme neperian" \
    "4" "Cosinus" \
    "5" "Sinus" \
    "6" "Exponentielle" \
    "7" "Tangente" \
    "8" "Racine Carre" \
    "9" "Quitter"  3>&1 1>&2 2>&3)

  
      case $message2 in
	      1)
 boucle4=1

   while [[ $boucle4 -eq 1 ]]; do
 nbr1=$(whiptail --inputbox "Factorielle " 10 70 --title "Entrer l'operande" 3>&1 1>&2 2>&3)
 
   
        temp=$nbr1
        factorielle=1
          
  #CALCULE LE FACTORIELLE D'UN NOMBRE NEGATIF
	 while [ $temp -lt 0 ]; do
             factorielle=$(( $factorielle * $temp ))
             temp=$(( $temp + 1 ))

         done

  #CALCULE LE FACTORIELLE D'UN NOMBRE POSITIF

         while [ $temp -gt 0 ]; do
             factorielle=$(( $factorielle * $temp ))
             temp=$(( $temp - 1 ))
	    
         done

        #AFFICHAGE DU RESULTAT
	  whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$factorielle" --fb 10 70
         boucle4=0
	  Repeter
    
done
  
         ;;

 2)
     #CALCUL DE LA PUISSANCE
	 
	resultat3=1


   nbr2=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Puissance" 3>&1 1>&2 2>&3)
   puis=$(whiptail --inputbox "Entrer la puissance " 10 70 --title "Puissance" 3>&1 1>&2 2>&3)
   
      
   if [[ $puis == +([[:digit:]]) ]]; then 
      resultat3=$( echo "$nbr2 ^ $puis" | bc -l)


           whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat3  " --fb 10 70


            Repeter

   #SI LA PUISSANCE EST UN FLOTTANT

       else

	        resultat3=$( echo "e( l($nbr2) * $puis )" | bc -l)


           whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat3  " --fb 10 70


            Repeter
	fi

  
   

	    ;;

    3)

  #CALCULE DE LOGARITHME NEPERIAN
  
      boucleL=1

     while [ $boucleL -eq 1 ]; do
           nbr5=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Logarithme neperian" 3>&1 1>&2 2>&3)
        if [ $nbr5 -gt 0 ]; then
     resultat2=$( echo "l($nbr5)" | bc -l )
       whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat2" --fb 10 70
       boucleL=0
       Repeter

       else

          whiptail --msgbox --title "ERROR " "Merci d'entrer un nombre dans l'intervalle ]0,+l'infini[ " --fb 10 70
          boucleL=1
        fi
done
       ;;


4)

   #CALCULE DE COSINUS
  
     nbr3=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Cosinus" 3>&1 1>&2 2>&3)

      resultat4=$( echo "c($nbr3)" | bc -l )
   whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat4" --fb 10 70
 
    Repeter

    ;;

     5)

   #CALCULE DE SINUS

     nbr4=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Sinus" 3>&1 1>&2 2>&3)

      resultat6=$( echo "s($nbr4)" | bc -l )
   whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat6 radian " --fb 10 70

    Repeter

     ;;

6)

   #CALCUL DE L'EXPONENTIELLE	


	 nbr8=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Exponentielle" 3>&1 1>&2 2>&3)

      resultat7=$( echo "e($nbr8)" | bc -l )
   whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat7 radian " --fb 10 70

     Repeter

     ;;
  

7)


         nbr9=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Tangente" 3>&1 1>&2 2>&3)
	 sin=$( echo  "s($nbr9) / c($nbr9)"  | bc -l )
       #cos=$( echo "c($nbr9)" | bc -l )

       #resultat8=$(( $sin / $cos ))
      
   whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$sin" --fb 10 70

     Repeter
        ;;


8)
   
  #CALCULE DE RACINE CARRE
	bouclel=1


      while [[ $bouclel = 1 ]]; do
	
	 nbr12=$(whiptail --inputbox "Enter l'operande " 10 70 --title "Racine carre" 3>&1 1>&2 2>&3)
     
  #TEST SI LE NOMBRE SUPERIEUR OU EGALE ZERO
  
	 if [[ $nbr12 -ge 0 ]];then
      resultat12=$( echo "sqrt($nbr12)" | bc -l )
   whiptail --msgbox --title "Resultat " "Le resultat de votre operation est :$resultat12 " --fb 10 70
     
     bouclel=0
     Repeter

      else
	      whiptail --msgbox --title "ERROR " "Merci d'entrer un nombre dans l'intervalle ]0,+l'infini[ " --fb 10 70
          bouclel=1
        fi
done
      


     ;;

9)

  whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0
     ;;


*)


        boucle=0
	Repeter
  ;;
 
 

esac

;;



3)
mess=$(whiptail --title "Conversion numerique" --fb --menu "Choix d'operations: " 20 60 5 \
    "1" "Conversion binaire de base" \
    "2" "Conversion decimal de base" \
    "3" "Conversion octal de base" \
    "4" "Conersion Hexadecimal de base" \
    "5" "Quitter" \
      3>&1 1>&2 2>&3)

  case $mess in 
	  1)


   #OPERATIONS BINAIRE DE BASE

message3=$(whiptail --title "Operation" --fb --menu "Choix d'operations: " 20 60 4 \
    "1" "Binaire=>decimal" \
    "2" "Binaire=>octal" \
    "3" "Binaire=>hexadecimal" \
    "4" "Quitter" \
      3>&1 1>&2 2>&3)

     
     case $message3 in

	     1)
  
		#CONVERTION BINAIRE => DECIMAL
  bcl2=1

     while [[ $bcl2 -eq 1 ]];do
      number1=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Binaire=>decimal" 3>&1 1>&2 2>&3)
    
   #LE NOMBRE DOIT CONTENIR DES 0 ET 1 UNIQUEMENT CAR C'EST NOMBRE BINAIRE
        if [[ "$number1" =~ ^[0-1]*$ ]] && [[ "$number9" != "" ]];then
      result1=$( echo "ibase=2;$number1" | bc -l )
        
     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result1 base(10)" --fb 10 70

      bcl2=0
      Repeter

       else
	    Error
	    bcl2=1
      
       fi

    done 
        ;;

2)
             #CONVERTION BINAIRE => OCTAL
  bcl2=1

  while [[ $bcl2 -eq 1 ]]; do
  
	  number1=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Binaire=>octal" 3>&1 1>&2 2>&3)

#LE NOMBRE DOIT CONTENIR DES 0 ET 1 UNIQUEMENT CAR C'EST NOMBRE BINAIRE
        if [[ "$number1" =~ ^[0-1]*$ ]] && [[ "$number9" != "" ]];then

	  result2=$( echo "ibase=2;obase=8;$number1" | bc -l )
  
     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result2 base(8)" --fb 10 70

      bcl2=0
      Repeter

        else
	 
	 Error
	 bcl2=1
     fi

    done

      ;;

     3)

	      #CONVERTION BINAIRE => HEXADECIMAL
  bcl2=1

  while [[ $bcl2 -eq 1 ]] ; do

    number3=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Binaire=>Hexadecimal" 3>&1 1>&2 2>&3)

   #LE NOMBRE DOIT CONTENIR DES 0 ET 1 UNIQUEMENT CAR C'EST NOMBRE BINAIRE
        if [[ "$number3" =~ ^[0-1]*$ ]] && [[ "$number9" != "" ]] ;then

          result2=$( echo "ibase=2;obase=10000;$number3" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result2 base(16)" --fb 10 70
      bcl2=0
      Repeter

       else
	   Error
	   bcl2=1

	  fi

   done
        ;;

4)
  
         whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0
       ;;

*)
  
	  Repeter
  

  ;;
  
esac
;;



2)

  #OPERATIONS DECIMALES DE BASE


  message4=$(whiptail --title "Operation" --fb --menu "Choix d'operations: " 20 60 4 \
    "1" "Decimal=>binaire" \
    "2" "Decimal=>octal" \
    "3" "Decimal=>hexadecimal" \
    "4" "Quitter" \
      3>&1 1>&2 2>&3)

  case $message4 in 

	  1)
              #CONVERTION DECIMALE => BINAIRE
  bcl7=1

        while [[ $bcl7 -eq 1 ]];do

number7=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Decimal=>Binaire" 3>&1 1>&2 2>&3)

	if [[ "$number7" =~ ^[0-9]*$ ]] && [[ "$number9" != "" ]] ;then

          result3=$( echo "obase=2;$number7" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result3 base(10)" --fb 10 70
      bcl7=0
      Repeter

      else
	  Error
	  bcl7=1
	fi

  done

      ;;

2)
	  #CONVERTION DECIMAL => OCTAL
  bcl1=1

       while [[ $bcl1 -eq 1 ]];do
	  number8=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Decimal=>Octal" 3>&1 1>&2 2>&3)
          
	  if [[ "$number8" =~ ^[0-9]*$ ]] && [[ "$number9" != "" ]] ;then
          result4=$( echo "obase=8;$number8" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result4 base(10)" --fb 10 70
      bcl1=0
      Repeter

        else
         Error
	 bcl1=1
	fi
 done

      ;;

   3)
                 #CONVERTION DECIMAL => HEXADECIMAL
    bcl1=1

      while [[ $bcl1 -eq 1 ]]; do

	   number9=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Decimal=>Hexadecimal" 3>&1 1>&2 2>&3)
           
	   if [[ "$number9" =~ ^[0-9]*$ ]] && [[ "$number9" != "" ]] ;then
          resultInt=$( echo "obase=2;$number9" | bc -l )
	  result4=$( echo "obase=16;ibase=2;$resultInt" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result4 base(10)" --fb 10 70
      bcl1=0
      Repeter

         else
	  Error
	  bcl1=1
	fi
   done
      ;;

4)


         whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0

	;;

*)
	 Repeter

	 ;;


 esac

  ;;

3)

          #OPERATIONS OCTALES DE BASE 
     message5=$(whiptail --title "Operation" --fb --menu "Choix d'operations: " 20 60 4 \
    "1" "Octal=>Binaire" \
    "2" "Octal=>decimal" \
    "3" "Octal=>hexadecimal" \
    "4" "Quitter" \
      3>&1 1>&2 2>&3)


     case $message5 in

	     1)
          #CONVERTION OCTAL => BINAIRE
  bcl1=1

    while [[ $bcl1 -eq 1 ]];do
   
   number10=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Octal=>Binaire" 3>&1 1>&2 2>&3)
         if [[ "$number10" =~ ^[0-7]$ ]] && [[ "$number10" != "" ]] ;then

          result5=$( echo "ibase=8;obase=2;$number10" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result5 base(2)" --fb 10 70
      bcl1=0
      Repeter

        else
	  Error
	  bcl1=1

	 fi
  done

    ;;

2)
	#CONVERTION OCTAL => DECIMAL
 bcll=1

    while [[ $bcll -eq 1 ]];do 
   number11=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Octal=>Decimal" 3>&1 1>&2 2>&3)

   if [[ "$number11" =~ ^[0-7]*$ ]] && [[ "$number11" != "" ]] ;then
          resultInt1=$( echo "ibase=8;obase=2;$number11" | bc -l )
          result6=$( echo "ibase=2;$resultInt1" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result6 base(10)" --fb 10 70
      
      bcll=0
      Repeter

   else
	   Error
	   bcll=1
	fi
done
        
      ;;

3)
	#CONVERTION OCTAL => HEXADECIMAL
 bcl2=1

     while [[ $bcl2 -eq 1 ]];do
    
   number12=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Octal=>Hexadecimal" 3>&1 1>&2 2>&3)

   if [[ "$number9" =~ ^[0-7]*$ ]] && [[ "$number9" != "" ]] ;then
          resultInt2=$( echo "ibase=8;$number12" | bc -l )
          result7=$( echo "obase=16;$resultInt2" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result7 base(16)" --fb 10 70
      bcl2=0
      Repeter

   else
      Error
      bcl2=1
       fi
   done
          ;;

  4)
   
         whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0
	;;


	*)
	  Repeter
         ;;
esac

;;


4)
 

                #OPERATIONS HEXADECIMALES DE BASE
  message6=$(whiptail --title "Operation" --fb --menu "Choix d'operations: " 20 60 4 \
    "1" "Hexadecimal=>binaire" \
    "2" "Hexadecimal=>decimal" \
    "3" "Hexadecimal=>octal" \
    "4" "Quitter" \
      3>&1 1>&2 2>&3)

     case $message6 in

	     1)
     #CONVERTION HEXADECIMAL => BINAIRE
     boucle4=1

     while [[ $boucle4 -eq 1 ]]; do
 
   number13=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Hexadecimal=>Binaire" 3>&1 1>&2 2>&3)
       
    var1=$( echo "$number13" | tr [a-z] [A-Z] )
   
   if [[ "$var1" =~ [^0-9A-F] ]] ;then
          Error
	  boucle4=1
   
    else

	 result8=$( echo "ibase=16;obase=2;$var1" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result8 base(2)" --fb 10 70
      boucle4=0
      Repeter

	 fi
  done
      ;;

2)
	#CONVERTION HEXADECIMAL => DECIMAL
boucle4=1

   while [[ $boucle4 -eq 1 ]];do
  
   number14=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Hexadecimal=>Decimal" 3>&1 1>&2 2>&3)

          var2=$( echo "$number14" | tr [a-z] [A-Z] )

	   if [[ "$var2" =~ [^0-9A-F] ]] || [[ "$var2" = "" ]] ;then
          Error
          boucle4=1

    else

          result9=$( echo "ibase=16;$var2" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result9 base(10)" --fb 10 70
      boucle4=0
      Repeter

	   fi 
	done

      ;;

3)   

            #CONVERTION HEXADECIMAL => OCTAL
   bcll=1

        while [[ $bcll -eq 1 ]];do   
   number15=$(whiptail --inputbox "Enter le nombre que vous voulez convertir " 10 70 --title "Hexadecimal=>Octal" 3>&1 1>&2 2>&3)

        var3=$( echo "$number15" | tr [a-z] [A-Z] )

           if [[ "$var3" =~ [^0-9A-F] ]] || [[ "$var3" = "" ]] ;then
          Error
          bcll=1

    else

          resultInt3=$( echo "ibase=16;$var3" | bc -l )
          result10=$( echo "obase=8;$resultInt3" | bc -l )

     whiptail --msgbox --title "Resultat " "Le resultat de votre operation est : $result10 base(8)" --fb 10 70
      bcll=0
      Repeter
      
  fi
 done
      ;;

4)
   
         whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0
	;;

*)
	  Repeter
        ;;
esac
;;

5)

   
         whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0
   ;;
   
*)
         Repeter

	;;		
        esac

;;
    
    

4)
	whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0

        ;;
*)

	Repeter 
	;;

esac
	
done    

;;

	   2)
whiptail --msgbox  "Notre calculatrice fait le calcule suivant:                  \
        1-Calcule basique a savoir : addition,soustraction,multiplication,division,modulo.                                     \
        2-Calcule avancee a savoir : la puissance,logarithme neperian,cos,sin,expo,tang...                                        \
        3-Les coversions d'une base a une autre (binaire,octal,decimal,hexadecimal).                                           \
        La saisie de des operandes se fait grace au clavier de l'utilisateur. \

        L'utilisateur peut revenir a la page precedente par le boutton 'cancel' et peut quitter grace au meme boutton s'il est encore dans la premiere page.\
        En cas ou l'utisateur veut refaire un autre calcule une page 'Repeter' est afficher a la fin de l'affichage de resultat." --title "A propos de notre calculatrice" 25 70
        
	;;
3) whiptail --title "Qui somme nous?" --msgbox "Ce travail a ete fait par: \
        Ouiam Khoudraji IRISI1 " 10 70
        

        ;;

*)
     whiptail --msgbox --title "QUITTER" "BYE BYE" --fb 10 70
        boucle=0

	;;


esac



