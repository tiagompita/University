#Mapa de registos
# i:		$t0
# i * 4:	$t5
# array:	$a0
# value:	$a1
# pos:		$a2
# size:		$a3
# array+i:	$t1
# array[i]:	$t2
# array+pos:	$t3
# array[pos]:	$t4

insert:	

if:	ble	$a2, $a3, else		# pos > size
	li	$v0, 1			# return 1
	jr $ra

else:	
	addiu	$t0, $a3, -1		# i = size-1
	
	
for_ins: blt	$t0, $a2, endfor_ins	# i >= pos
	
	sll	$t5, $t0, 2		# i * 4
	addu	$t1, $a0, $t5		# array+i
	lw	$t2, 0($t1)		# array[i]
	
	addiu	$t2, $t2, 4		# array+i+1
	sw	$t2, 0($t1)		# array[i+1] = array[i]
	
	addiu	$t0, $t0, -1		# i--
	j for_ins
endfor_ins:

	sll	$a2, $a2, 2		# pos * 4
	addu	$t3, $a0, $a2		# array+pos
	sw	$a1, 0($t3)		# array[pos] = value
	
	li	$v0, 0			# return 0
	jr $ra