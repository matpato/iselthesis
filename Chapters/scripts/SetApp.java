import collections.Set;

import java.util.Scanner;

/**
 *
 */
public class SetApp {
    private static final int MAX_SETS = 10;

    /**
     * Usage:
     * java SetApp
     *
     * Enter collections.Set 1: 2 3 4 2 5 6 4 -1
     * Enter collections.Set 2: 2 5 6 4 1 0 2 1 -1
     * Enter collections.Set 3: 1 1 1 -1
     * Enter collections.Set 4: -1
     *
     * collections.Set 3: 1
     * collections.Set 1: 2 3 4 5 6
     * collections.Set 2: 0 1 2 4 5 6
     *
     * @param args
     */
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);


        Set[] sets = new Set[MAX_SETS];
        int numSets = 0;


        boolean finish = false;
        do {
            System.out.println("collections.Set " + numSets + ":");
            Set s = new Set();
            do {
                int i = in.nextInt();
                if (i < 0) {
                    break;
                }
                s.add(i);
            } while (true);
            if(s.getSize() != 0) {
                sets[numSets++] = s;
            } else {
                finish = true;
            }
        } while(!finish);


        for (int i = 0; i < numSets; i++) {
            printSet(sets[i]);
        }

    }

    private static void printSet(Set set) {  // comment
        int[] elements = set.getElements();
        System.out.print('{');
        for (int i = 0; i < elements.length; i++) {
            System.out.print(elements[i] + (i == elements.length-1 ? "" : ","));
        }
        System.out.println('}');
    }
}
