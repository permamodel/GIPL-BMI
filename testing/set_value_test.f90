    program set_value_test
	use bmif
	implicit none

	type (BMI_Model) :: m
	integer :: s,grid_id
	integer :: dims(2)
	!integer, dimension (1:2) :: grid_id
	character (len=22), pointer :: names(:)
	real*8, pointer :: z(:)
	integer :: locations(3)
	real*8 :: values(3)


	write (*,"(A)",advance="no") "Initializing..."
	call BMI_Initialize (m, "../../examples/gipl_cfg.cfg")
	write (*,*) "Done."

	call BMI_Get_output_var_names(m, names)
	write (*,"(a, a)") "Output variables: ", names

	! get the dimension of the names() variable
	call BMI_get_var_grid(m, names(1), grid_id)
	write (*,*) "grid_id of the ",names(1),': ', grid_id

	call BMI_get_grid_shape(m, grid_id, dims)
	write (*,*) "shape of the ",names(1),': ', dims

	write (*, "(a)") "Get values:"
	call BMI_get_value(m, names(1), z)
	write(*,*)z

	write (*,"(a)",advance="no") "Setting new values..."
	z(1) = 42.0
	z(176)=100 
	call BMI_set_value(m, names(1), z)
	write(*,*)z
	!write (*,*) "Done."

	!call BMI_Get_time_units (self, names(1))

	write (*, "(a)") "Set values at three locations:"
	locations = (/1, 175, 176/)
	values = (/-98.0, -99.0, -100.0/)
	write (*,*) "Locations: ", locations
	write (*,*) "Values: ", values
	call BMI_set_value_at_indices(m, names(1), locations, values)

	write (*, "(a)") "Get values:"
	call BMI_get_value(m, names(1), z)
	write(*,*)z
    end program set_value_test

