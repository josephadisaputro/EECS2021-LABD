public class FractionClient 
{ 
    public static void main(String[] args) 
    {    
        Fraction a = new Fraction(3,8); 
        Fraction b = new Fraction(1,2); 
        a.add(b);    
        System.out.print(a.getNumerator());    
        System.out.print('/');    
        System.out.print(a.getDenominator());    
    }    
} 
