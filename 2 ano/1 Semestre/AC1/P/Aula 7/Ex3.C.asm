# Mapa de Registos
# dst:	$a0
# src:	$t0
# *p:	$t1
#

strcpy:
    	move    $t1, $a0        	# p = dst
    	move    $t0, $a1        	# $t0 = src

do:
    	lb      $t6, 0($t0)     	# *src 
    	sb      $t6, 0($t1)     	# *p = *src 

    	addiu   $t0, $t0, 1     	# src++
    	addiu   $t1, $t1, 1     	# p++

	lb      $t6, 0($t0)     	# *src++
    	bne     $t6, '\0', do   	# while (*src++ != '\0')

    	move    $v0, $a0        	# return dst
    	jr      $ra             	# exit