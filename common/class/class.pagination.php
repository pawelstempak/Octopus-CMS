<?php
// +------------------------------------------------------------------------+
// | class.pagination.php                                                   |
// +------------------------------------------------------------------------+
// | Description                                                            |
// +------------------------------------------------------------------------+


class Pagination
{
	public function __construct($rows_number,$query)
	{
		global $pdo;

		//The number of lines per page
		$this->rows_number = $rows_number;

		//Getting the number of query results - all rows number
		$stmt=$pdo->prepare($query);
		$stmt->execute();
		$all_rows_number = $stmt->rowCount();
		$stmt->closeCursor();
		unset($stmt);

		//The number of all rows in query
		$this->all_rows_number = $all_rows_number;
	}

	public function getPagNumbers () {
		return ceil($this->all_rows_number / $this->rows_number);
	}

}
