class FileInfo < ActiveRecord::Base
  belongs_to :directory
  
  Stat = Struct.new(:mtime, :size, :uid, :gid)
  class Stat
    def ==(s)
      mtime == s.mtime && size == s.size && uid == s.uid && gid == s.gid
    end
  end
  
  # Convenience method for setting all the fields associated with stat in one hit
  def stat=(stat)
    self.modified = stat.mtime
    self.size = stat.size
    self.uid = stat.uid
    self.gid = stat.gid
  end
  
  # Returns a "fake" Stat object with some of the same information as File::Stat
  def stat
    Stat.new(modified, size, uid, gid)
  end
  
  def FileInfo.find_by_directory_and_name(directory, name)
    FileInfo.find(:first, :conditions => ['directory_id = ? AND name = ?', directory.id, name])
  end
end
