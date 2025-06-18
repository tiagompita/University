# Mapa de Registos
# i:	$t0
# dst:	$t1	dst+i:	$t2	dst[i]:	$t3
# src:	$t4	src+i:	$t5	src[i]:	$t6
	

strcpy:
	li      $t0, 0          	# i = 0
	move    $t1, $a0        	# $t1 = dst
    	move    $t4, $a1        	# $t4 = src

do:					# do {
    	addu    $t2, $t1, $t0   	# dst+i
    	addu    $t5, $t4, $t0   	# src+i
    	
    	lb      $t6, 0($t5)     	# src[i]
    	sb      $t6, 0($t2)     	# dst[i] = src[i]
    	
    	addiu   $t0, $t0, 1     	# i++
    	
    	lb	$t6, 1($t5)		# 
    	bne     $t6, '\0', do	 	# } while( src[i++] != '\0' )

    	move    $v0, $a0        	# return dst
    	jr      $ra             	# exit

