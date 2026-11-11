let variableName = 10;
const CONSTANT_VAL = 100;
var functionTest = function(ifCondition) {
    if (ifCondition) {
        return true;
    } else {
        return false;
    }
};

var normalInt = 42;
var separatedInt = 1_000_000;
var float1 = 3.14;
var float2 = .5;
var float3 = 5.;
var floatExp = 2.5E-3;
var hexNum = 0xFF;
var octalNum = 0o17;
var binaryNum = 0b1010;
var separatedFloat = 1_0.0_1;

var bigInt1 = 123n;
var bigIntHex = 0xFFn;
var bigIntBin = 0b1010n;

var singleStr = 'Hello \'World\'';
var doubleStr = "Line 1 \nLine 2 continuation";
var escapedStr = "Tab\tNewline\nSlash\\";

var userName = "ANTLR4";
var simpleTemplate = `Hello, ${userName}!`;
var nestedTemplate = `Outer ${ `Inner ${ 1 + 1 }` }`;

// Single line comment
/* Multi-line
   comment */
var result = 10 + 20;
var check = (5 === 5) && (3 !== 2);
var arrowFunc = (x) => x ** 2;

var unclosedString = "Hello without closing quote;