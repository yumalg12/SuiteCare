package Preference;

public class Pair<A, B> {
    private final A first;
    private final B second;

    public Pair(A first, B second) {
        this.first = first;
        this.second = second;
    }

	/**
	 * @return the first
	 */
	public A getFirst() {
		return first;
	}

	/**
	 * @return the second
	 */
	public B getSecond() {
		return second;
	}
    
    
}
