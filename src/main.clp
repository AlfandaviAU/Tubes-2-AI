; BAGIAN ASK

(defrule ask_concave_points_mean
=>
    (printout t "mean_concave points? ")
    (assert(concave_points_mean (read)))
)
(defrule ask_radius_mean
    (radius_mean)
=>
    (printout t "mean_radius? ")
    (assert (radius_mean (read)))
)
(defrule ask_texture_worst
    (texture_worst)
=>
    (printout t "worst_texture? ")
    (assert (texture_worst (read)))
)
(defrule ask_radius_worst
    (radius_worst)
=>
    (printout t "worst_radius? ")
    (assert(radius_worst (read)))
)

(defrule ask_radius_error
    (radius_error)
=>
    (printout t "radius_error? ")
    (assert(radius_error (read)))
)

(defrule ask_texture_mean
    (texture_mean)
=>
    (printout t "texture_mean? ")
    (assert(texture_mean (read)))
)

(defrule ask_concave_point_error
    (concave_point_error)
=>
    (printout t "concave_point_error? ")
    (assert(concave_point_error (read)))
)

(defrule ask_smoothness_mean
    (smoothness_mean)
=>
    (printout t "smoothness_mean? ")
    (assert(smoothness_mean (read)))
)

(defrule ask_area_worst
    (area_worst)
=>
    (printout t "area_worst? ")
    (assert(area_worst (read)))
)
(defrule ask_perimeter_worst
    (perimeter_worst)
=>
    (printout t "worst_perimeter? ")
    (assert(worst_perimeter (read)))
)

(defrule ask_concave_points_worst
    (concave_point_worst)
=>
    (printout t "worst_concave_points? ")
    (assert(concave_points_worst (read)))
)

(defrule ask_perimeter_error
    (perimeter_error)
=>
    (printout t "perimeter_error? ")
    (assert(perimeter_error (read)))
)

; BAGIAN PROCESS
(defrule process_concave_points_mean
    (concave_points_mean ?x)
=>
    (if (<= ?x 0.05)
        then
        (assert (radius_worst))
        (assert (left_branch))
        else
        (assert (perimeter_worst))
        (assert (right_branch))
    )
)

(defrule process_radius_worst
    (radius_worst ?x)
=>
    (if (<= ?x 16.83)
        then
        (assert (radius_error))
        (assert (left_texture))
        else
        (assert (texture_mean))
        (assert (right_texture))
    )
)

(defrule process_right_texture_mean
    (texture_mean ?x)
    (right_texture)
=>
    (if (<= ?x 16.19)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (concave_point_error))
    )
)

(defrule process_concave_point_error
    (concave_point_error ?x)
=>
    (if (<= ?x 0.01)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule process_radius_error
    (radius_error ?x)
=>
    (if (<= ?x 0.63)
        then
        (assert (texture_worst))
        else
        (assert (smoothness_mean))
    )
)

(defrule process_smoothness_mean
    (smoothness_mean ?x)
=>
    (if (<= ?x 0.09)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule process_left_texture_worst
    (texture_worst ?x)
    (left_branch)
=>
    (if (<= ?x 30.15)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (area_worst))
    )
)

(defrule process_area_worst
    (area_worst ?x)
=>
    (if (<= ?x 641.60)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (radius_mean))
    )
)

(defrule process_left_radius_mean
    (radius_mean ?x)
    (left_branch)
=>
    (if (<= ?x 13.45)
        then
        (assert (texture_mean))
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule process_left_texture_mean
    (texture_mean ?x)
    (left_texture)
=>
    (if (<= ?x 28.79)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule process_worst_perimeter
    (worst_perimeter ?x)
=>
    (if (<= ?x 114.45)
        then
        (assert (texture_worst))
        else
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule process_texture_worst_right_branch
    (texture_worst ?x)
    (right_branch)
=>
    (if (> ?x 25.65)
        then
        (assert (perimeter_error))
        else
        (assert (concave_point_worst))
    )
)

(defrule process_concave_point_worst
    (concave_points_worst ?x)
=>
    (if (> ?x 0.17)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)

(defrule process_perimeter_error
    (perimeter_error ?x)
=>
    (if (> ?x 1.56)
        then
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (assert (radius_mean))
    )
)

(defrule process_radius_mean_right_branch
    (radius_mean ?x)
    (right_branch)
=>
    (if (> ?x 13.34)
        then
        (printout t "Hasil Prediksi = Terprediksi Kanker Payudara" crlf)
        (halt)
        else
        (printout t "Hasil Prediksi = Tidak Terprediksi Kanker Payudara" crlf)
        (halt)
    )
)
