# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Pname, Ssn, Fname, Minit, Lname ((project ⨝ Pnumber = Pno works_on) ⨝ Essn = Ssn employee)
```


### *b)* 

```
π Fname, Lname (employee ⨝ Super_ssn = CdG.Ssn (ρ CdG (π Ssn (σ Fname='Carlos' ∧ Minit = 'D' ∧ Lname = 'Gomes' employee))))
```


### *c)* 

```
γ Pname; sum(Hours) -> TotalHours (project ⨝ Pnumber = Pno works_on)
```


### *d)* 

```
π Fname, Lname (σ Dno = 3 ∧ Hours > 20 ∧ Pname = 'Aveiro Digital' (employee ⨝ Ssn = Essn works_on ⨝ Pno = Pnumber project))
```


### *e)* 

```
π Fname,Lname (σ works_on.Essn = null (employee ⟗ Ssn = Essn works_on))
```


### *f)* 

```
... Write here your answer ...
```


### *g)* 

```
... Write here your answer ...
```


### *h)* 

```
... Write here your answer ...
```


### *i)* 

```
... Write here your answer ...
```


## ​Problema 5.2

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
... Write here your answer ...
```


## ​Problema 5.3

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
... Write here your answer ...
```

### *f)* 

```
... Write here your answer ...
```
