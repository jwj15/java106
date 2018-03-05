// 부동소수점 변수 - 단정도와 배정도
package step02;

public class Exam05_2 {
    public static void main(String[] args) {
        float f;
        double d;

        // 부동소수점 리터럴 값 뒤에 f나 F를 붙이면,
        // 4바이트 크기의 부동소수점 값을 의미한다.
        // 따라서 변수(메모리)에 값을 넣기 전에 
        // 이미 리터럴 값이 4바이트 크기로 고정시키기 위해서
        // 유효자릿수를 넘어가는 값은 짤린다.
        // 그래서 d 변수에 실제 저장되는 값은 이미 4바이트 메모리에 
        // 저장될 수 있도록 짤린 값이 저장된다.
        f = 9876.98769876f;
        d = 9876.98769876f;

        System.out.println(f);
        System.out.println(d);
        // 주의!
        // 정수의 경우 리터럴을 표현할 때 
        // 값이 그 크기를 넘어가면 컴파일 오류가 발생하지만,
        // 부동소수점의 경우 리터럴이 메모리의 크기를 넘어갈 때
        // 컴파일 오류 대신 단지 값이 짤릴 뿐이다.

        // double(8byte) 값 ==> float(4byte) 메모리
        // 컴파일 오류 발생!
        //f = 9876.98769876;

        // double 메모리에 리터럴 값을 넣을 때는
        // 8바이트 부동소수점 리터럴을 넣어라!
        // 즉 리터럴 뒤에 f나 F를 붙이지 말라!
        d = 9876.98769876;

        System.out.println(f);
        System.out.println(d);
    }
}

// 결론!
// - float 메모리에 값을 저장할 때는
//   유효자릿수가 7자리 이하인 
//   4바이트 부동소수점(f 또는 F가 붙은)을 저장하라!
// - double 메모리에 값을 저장할 때는
//   유효자릿수가 15자리 이하인 8바이트 부동소수점을 저장하라!