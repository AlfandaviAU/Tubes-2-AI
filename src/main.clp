;; mainprogram, flag ;; van
(defrule startProgram
    ?o <- (closed 0 0)
    =>
    (assert (opened 0 0))
    (assert (status program))
    (assert (flag-pasien 0))
    (retract ?o)
)

(defrule true-cancer
    (flag-pasien ?n) 1
    ?s <- (status program)
    =>
    (retract ?s)
    (assert (status true)))


(defrule false-cancer
    (flag-pasien ?n) 0
    ?s <- (status program)
    =>
    (retract ?s)
    (assert (status false)))

(defrule startDetect
    (radius_mean ?input_radius_mean)
    =>
    if (> 0.05 ( input_radius_mean)) then 
        (detect_perimeter_worst)
    else
        (detect_radius_worst)
)

(defrule detect_perimeter_worst
    (perimeter_worst ?input_perimeter_worst)
    => 
    if (> 114.45 ( input_perimeter_worst )) then
        (false-cancer)
    else
        (detect_texture_worst)
)

;; input data oleh pengguna ;; van
(defrule inputdata
=>
    (printout t "radius_mean? ")
    (bind ?input_radius_mean(readline))

    (printout t "texture_mean? ")
    (bind ?input_texture_mean (readline))

    (printout t "perimeter_mean? ")
    (bind ?input_perimeter_mean (readline))

    (printout t "area_mean? ")
    (bind ?input_area_mean (readline))

    (printout t "smoothness_mean? ")
    (bind ?input_smoothness_mean(readline))
    
    (printout t "compactness_mean? ")
    (bind ?input_compactness_mean (readline))

    (printout t "concavity_mean? ")
    (bind ?input_concavity_mean (readline))

    (printout t "concave points_mean? ")
    (bind ?input_concave points_mean (readline))

    (printout t "symmetry_mean? ")
    (bind ?input_symmetry_mean (readline))

    (printout t "fractal_dimension_mean? ")
    (bind ?input_fractal_dimension_mean (readline))

    (printout t "radius_se? ")
    (bind ?input_radius_se (readline))

    (printout t "texture_se? ")
    (bind ?input_texture_se (readline))

    (printout t "perimeter_se? ")
    (bind ?input_perimeter_se (readline))

    (printout t "texture_se? ")
    (bind ?input_texture_se (readline))

    (printout t "smoothness_se? ")
    (bind ?input_smoothness_se (readline))

    (printout t "area_se? ")
    (bind ?input_area_se (readline))

    (printout t "compactness_se? ")
    (bind ?input_compactness_se (readline))

    (printout t "concavity_se? ")
    (bind ?input_concavity_se (readline))

    (printout t "concave_points_se? ")
    (bind ?input_concave_points_se (readline))

    (printout t "symmetry_se? ")
    (bind ?input_symmetry_se (readline))

    (printout t "fractal_dimension_se? ")
    (bind ?input_fractal_dimension_se (readline))

    (printout t "radius_worst? ")
    (bind ?input_radius_worst (readline))

    (printout t "texture_worst? ")
    (bind ?input_texture_worst (readline))

    (printout t "perimeter_worst? ")
    (bind ?input_perimeter_worst (readline))

    (printout t "area_worst? ")
    (bind ?input_area_worst (readline))

    (printout t "smoothness_worst? ")
    (bind ?input_smoothness_worst (readline))

    (printout t "compactness_worst? ")
    (bind ?input_compactness_worst (readline))

    (printout t "concavity_worst? ")
    (bind ?input_concavity_worst (readline))

    (printout t "concave_points_worst? ")
    (bind ?input_concave_points_worst (readline))

    (printout t "symmetry_worst? ")
    (bind ?input_symmetry_worst (readline))

    (printout t "fractal_dimension_worst ")
    (bind ?input_fractal_dimension_worst (readline))

    (assert 	
            (radius_mean ?input_radius_mean)
            (texture_mean ?input_texture_mean)
            (perimeter_mean ?input_perimeter_mean)
            (area_mean ?input_area_mean)
            (smoothness_mean ?input_smoothness_mean)
            (compactness_mean ?input_compactness_mean)
            (concavity_mean ?input_concavity_mean)
            (concave points_mean ?input_concave points_mean)
            (symmetry_mean ?input_symmetry_mean)
            (fractal_dimension_mean ?input_fractal_dimension_mean)
            (radius_se ?input_radius_se)
            (texture_se ?input_texture_se)
            (perimeter_se ?input_perimeter_se)
            (smoothness_se ?input_smoothness_se)
            (area_se ?input_area_se)
            (compactness_se ?input_compactness_se)
            (concavity_se ?input_concavity_se)
            (concave_points_se ?input_concave_points_se)
            (symmetry_se ?input_symmetry_se)
            (fractal_dimension_se ?input_fractal_dimension_se)
            (radius_worst ?input_radius_worst)
            (texture_worst ?input_texture_worst)
            (perimeter_worst ?input_perimeter_worst)
            (area_worst ?input_area_worst)
            (smoothness_worst ?input_smoothness_worst)
            (compactness_worst ?input_compactness_worst)
            (concavity_worst ?input_concavity_worst)
            (concave_points_worst ?input_concave_points_worst)
            (symmetry_worst ?input_symmetry_worst)
            (fractal_dimension_worst ?input_fractal_dimension_worst)
    )

)