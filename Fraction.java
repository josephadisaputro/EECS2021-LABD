public class Fraction 
{ 
    private int numerator; 
    private int denominator; 
    public Fraction(int numerator, int denominator) 
    {    
        this.numerator    =    numerator;    
        this.denominator    =    denominator;    
    }    
    public int getNumerator()   { return this.numerator;  } 
    public int getDenominator() { return this.denominator;} 
    public void add(Fraction other) 
    {    
        this.numerator = this.numerator * other.denominator + 
                         this.denominator * other.numerator; 
        this.denominator = this.denominator * other.denominator; 
    }    
} 
