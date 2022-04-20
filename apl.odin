
import "core:fmt"

examples :: proc() {
	{
		a := [3]f32{1, 2, 3}
		b := [3]f32{5, 6, 7}
		c := a * b
		d := a + b
		e := 1 +  (c - d) / 2
		fmt.printf("%.1f\n", e) // [0.5, 3.0, 6.5]
	}

	{
		a := [3]f32{1, 2, 3}
		b := swizzle(a, 2, 1, 0)
		assert(b == [3]f32{3, 2, 1})

		c := swizzle(a, 0, 0)
		assert(c == [2]f32{1, 1})
		assert(c == 1)
	}

	{
		Vector3 :: distinct [3]f32
		a := Vector3{1, 2, 3}
		b := Vector3{5, 6, 7}
		c := (a * b)/2 + 1
		d := c.x + c.y + c.z
		fmt.printf("%.1f\n", d) // 22.0

		cross :: proc(a, b: Vector3) -> Vector3 {
			i := swizzle(a, 1, 2, 0) * swizzle(b, 2, 0, 1)
			j := swizzle(a, 2, 0, 1) * swizzle(b, 1, 2, 0)
			return i - j
		}

		cross_shorter :: proc(a, b: Vector3) -> Vector3 {
			i := a.yzx * b.zxy
			j := a.zxy * b.yzx
			return i - j
		}

		blah :: proc(a: Vector3) -> f32 {
			return a.x + a.y + a.z
		}

		x := cross(a, b)
		fmt.println(x)
		fmt.println(blah(x))
	}
}

chapter_3 :: proc() {
  fmt.println("Chapter 3 Exercises")
  // 1. 
  // On one line, assign the vector 3 4 5 6 7 to the name 'a' and make 'b' = 2*a
  fmt.println("\n3.1")
  a := [5]f32{3,4,5,6,7}
  b := 2 * a
  fmt.printf("a: %.1f\n", a)
  fmt.printf("b = 2 * a: %.1f\n", b)


  // 3.
  // Construct a matrix M with 5 rows and 3 columns, consisting of entirely of the number 7. Ditto for a matrix ! of the same size as M, each of whose rows
  // contain 4 9 11
  fmt.println("\n3.3")
  row : [3]f32 = {7,7,7}
  m := matrix[5,3]f32{}
  fmt.println("m[1]", m[0])
  /* m[1] = row */
  fmt.println("m", m)


  // 4.
  // Convert the matrix m from above into a matrix n of all 1's in at least two different ways

  // 5.
  // Long word problem

  // 6.
  // What is the difference between A B. and A,B. ?

}

main :: proc() {
  when true {
    chapter_3()
    examples()
  }
}
