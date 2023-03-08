//package org.example.domain;
//import org.junit.Test;
//import static org.junit.Assert.*;
//public class PageHandlerTest {
//    @Test
//    public void test(){
//        PageHandler ph = new PageHandler(250, 1);
//// 게시물이 250개니까 페이지가 25개 나올 것을 예상하고 있다.
//        ph.print();
//        System.out.println("ph = " + ph);
//      assertTrue(ph.getBeginPage() == 1);
//      assertTrue(ph.getEndPage() == 10);
//    }
//    @Test
//    public void test2(){
//        PageHandler ph = new PageHandler(250, 11);
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.getBeginPage() == 11);
//        assertTrue(ph.getEndPage() == 20);
//    }
//    @Test
//    public void test3(){
//        PageHandler ph = new PageHandler(255, 25);
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.getBeginPage() == 21);
//        assertTrue(ph.getEndPage() == 26);
////===> 테스트 할때에는 경계가 되는 지점 맨 끝과 맨 앞에 이런 부분들을 테스트를 잘 해야 한다
//    }
//
//    @Test
//    public void test4(){
//        PageHandler ph = new PageHandler(255, 10);
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.getBeginPage() == 1);
//        assertTrue(ph.getEndPage() == 10);
////===> 테스트 할때에는 경계가 되는 지점 맨 끝과 맨 앞에 이런 부분들을 테스트를 잘 해야 한다
//    }
//
//
//
//}